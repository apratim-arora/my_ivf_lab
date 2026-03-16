import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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

  static const _cryoOptions = ['Cryotop', 'Cryolock', 'Straw', 'Other'];

  @override
  void initState() {
    super.initState();
    final transfer = ref.read(transferProvider(widget.cycleId)).asData?.value;
    if (transfer != null) {
      _transferred.text = transfer.embryosTransferred?.toString() ?? '';
      _frozen.text = transfer.embryosFrozen?.toString() ?? '';
      _device = transfer.cryoDevice;
      _date = transfer.transferDate;
    }
  }

  @override
  void dispose() {
    _transferred.dispose();
    _frozen.dispose();
    super.dispose();
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
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Transfer & Freezing')),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
    );
  }
}
