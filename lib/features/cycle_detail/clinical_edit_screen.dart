import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../cycle_form/cycle_form_notifier.dart';
import '../../shared/widgets/labeled_field.dart';

class ClinicalEditScreen extends ConsumerStatefulWidget {
  final int cycleId;
  const ClinicalEditScreen({super.key, required this.cycleId});

  @override
  ConsumerState<ClinicalEditScreen> createState() => _ClinicalEditScreenState();
}

class _ClinicalEditScreenState extends ConsumerState<ClinicalEditScreen> {
  final _amh = TextEditingController();
  final _bmi = TextEditingController();
  bool _initialized = false;

  @override
  void dispose() {
    _amh.dispose();
    _bmi.dispose();
    super.dispose();
  }

  void _sync(IvfCycle cycle) {
    if (_initialized) return;
    _amh.text = cycle.amh?.toString() ?? '';
    _bmi.text = cycle.bmi?.toString() ?? '';
    _initialized = true;
  }

  Future<void> _save() async {
    await ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        amh: Value(double.tryParse(_amh.text)),
        bmi: Value(double.tryParse(_bmi.text)),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinical Parameters'),
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
              LabeledField(label: 'AMH (ng/ml)', controller: _amh, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
              LabeledField(label: 'BMI', controller: _bmi, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () async {
                  await _save();
                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Clinical data saved')));
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
