import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/database/app_database.dart';
import '../transfer/transfer_notifier.dart';

class TransferEditScreen extends ConsumerStatefulWidget {
  final int cycleId;
  const TransferEditScreen({super.key, required this.cycleId});

  @override
  ConsumerState<TransferEditScreen> createState() => _TransferEditScreenState();
}

class _TransferEditScreenState extends ConsumerState<TransferEditScreen> {
  final _transferred = TextEditingController();
  final _frozen = TextEditingController();
  String? _device;
  DateTime? _date;
  bool _initialized = false;

  static const _cryoOptions = ['Cryotop', 'Cryolock', 'Straw', 'Other'];

  @override
  void dispose() {
    _transferred.dispose();
    _frozen.dispose();
    super.dispose();
  }

  void _sync(EmbryoTransfer? transfer) {
    if (_initialized) return;
    if (transfer != null) {
      _transferred.text = transfer.embryosTransferred?.toString() ?? '';
      _frozen.text = transfer.embryosFrozen?.toString() ?? '';
      _device = transfer.cryoDevice;
      _date = transfer.transferDate;
    }
    _initialized = true;
  }

  void _save() {
    ref.read(transferEditorProvider(widget.cycleId).notifier).save(
          embryosTransferred: int.tryParse(_transferred.text),
          embryosFrozen: int.tryParse(_frozen.text),
          cryoDevice: _device,
          transferDate: _date,
        );
  }

  @override
  Widget build(BuildContext context) {
    final transferAsync = ref.watch(transferProvider(widget.cycleId));
    transferAsync.whenData(_sync);

    return Scaffold(
      appBar: AppBar(title: const Text('Transfer & Freezing')),
      body: transferAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (_) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              controller: _transferred,
              decoration: const InputDecoration(labelText: 'Embryos Transferred', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => _save(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _frozen,
              decoration: const InputDecoration(labelText: 'Embryos Frozen', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => _save(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _cryoOptions.contains(_device) ? _device : null,
              decoration: const InputDecoration(labelText: 'Cryo Device', border: OutlineInputBorder()),
              items: _cryoOptions.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
              onChanged: (v) {
                setState(() => _device = v);
                _save();
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Transfer Date'),
              subtitle: Text(_date != null ? DateFormat('dd MMM yyyy').format(_date!) : 'Not set'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: _date ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) {
                  setState(() => _date = d);
                  _save();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
