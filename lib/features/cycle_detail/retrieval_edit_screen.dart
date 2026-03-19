import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../cycle_form/cycle_form_notifier.dart';
import '../../shared/widgets/labeled_field.dart';

class RetrievalEditScreen extends ConsumerStatefulWidget {
  final int cycleId;
  const RetrievalEditScreen({super.key, required this.cycleId});

  @override
  ConsumerState<RetrievalEditScreen> createState() => _RetrievalEditScreenState();
}

class _RetrievalEditScreenState extends ConsumerState<RetrievalEditScreen> {
  final _occ = TextEditingController();
  final _mii = TextEditingController();
  final _mi = TextEditingController();
  final _gv = TextEditingController();
  bool _initialized = false;

  @override
  void dispose() {
    _occ.dispose();
    _mii.dispose();
    _mi.dispose();
    _gv.dispose();
    super.dispose();
  }

  void _sync(IvfCycle cycle) {
    if (_initialized) return;
    _occ.text = cycle.occRecovered?.toString() ?? '';
    _mii.text = cycle.oocyteMii?.toString() ?? '';
    _mi.text = cycle.oocyteMi?.toString() ?? '';
    _gv.text = cycle.oocyteGv?.toString() ?? '';
    _initialized = true;
  }

  Future<void> _save() async {
    await ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        occRecovered: Value(int.tryParse(_occ.text)),
        oocyteMii: Value(int.tryParse(_mii.text)),
        oocyteMi: Value(int.tryParse(_mi.text)),
        oocyteGv: Value(int.tryParse(_gv.text)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<IvfCycle?>>(cycleFormProvider(widget.cycleId), (prev, next) {
      next.whenData((cycle) {
        if (cycle != null && !_initialized) setState(() => _sync(cycle));
      });
    });

    final cycleAsync = ref.watch(cycleFormProvider(widget.cycleId));

    final mii = int.tryParse(_mii.text) ?? 0;
    final mi = int.tryParse(_mi.text) ?? 0;
    final gv = int.tryParse(_gv.text) ?? 0;
    final occ = int.tryParse(_occ.text) ?? 0;
    final showWarning = (mii + mi + gv) > occ;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Oocyte Retrieval'),
        actions: [
          TextButton(
            onPressed: () async {
              await _save();
              if (mounted) Navigator.pop(context);
            },
            child: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: cycleAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (cycle) {
          if (cycle != null && !_initialized) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() => _sync(cycle));
            });
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              LabeledField(label: 'OCC Recovered', controller: _occ, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (_) => setState(() => _save())),
              const Divider(height: 40),
              Row(
                children: [
                  Expanded(child: LabeledField(label: 'MII', controller: _mii, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (_) => setState(() => _save()))),
                  const SizedBox(width: 8),
                  Expanded(child: LabeledField(label: 'MI', controller: _mi, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (_) => setState(() => _save()))),
                  const SizedBox(width: 8),
                  Expanded(child: LabeledField(label: 'GV', controller: _gv, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (_) => setState(() => _save()))),
                ],
              ),
              if (showWarning)
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                        const SizedBox(width: 12),
                        Expanded(child: Text('Warning: Oocyte counts exceed recovered total.', style: TextStyle(color: Colors.orange[900], fontSize: 13))),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () async {
                  await _save();
                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Retrieval data saved')));
                },
                child: const Text('Save Changes'),
              ),
            ],
          );
        },
      ),
    );
  }
}
