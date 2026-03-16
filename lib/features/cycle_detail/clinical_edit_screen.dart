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

  @override
  void initState() {
    super.initState();
    final cycle = ref.read(cycleFormProvider(widget.cycleId)).asData?.value;
    if (cycle != null) {
      _amh.text = cycle.amh?.toString() ?? '';
      _bmi.text = cycle.bmi?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    _amh.dispose();
    _bmi.dispose();
    super.dispose();
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
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Clinical Params')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LabeledField(label: 'AMH (ng/ml)', controller: _amh, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
          LabeledField(label: 'BMI', controller: _bmi, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
        ],
      ),
    );
  }
}
