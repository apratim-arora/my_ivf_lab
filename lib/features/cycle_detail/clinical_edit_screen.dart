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

  void _save() {
    ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        amh: Value(double.tryParse(_amh.text)),
        bmi: Value(double.tryParse(_bmi.text)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cycleAsync = ref.watch(cycleFormProvider(widget.cycleId));
    cycleAsync.whenData((c) { if (c != null) _sync(c); });

    return Scaffold(
      appBar: AppBar(title: const Text('Clinical Parameters')),
      body: cycleAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (_) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            LabeledField(label: 'AMH (ng/ml)', controller: _amh, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
            LabeledField(label: 'BMI', controller: _bmi, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
          ],
        ),
      ),
    );
  }
}
