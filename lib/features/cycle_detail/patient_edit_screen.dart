import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../cycle_form/cycle_form_notifier.dart';
import '../../shared/widgets/labeled_field.dart';

class PatientEditScreen extends ConsumerStatefulWidget {
  final int cycleId;
  const PatientEditScreen({super.key, required this.cycleId});

  @override
  ConsumerState<PatientEditScreen> createState() => _PatientEditScreenState();
}

class _PatientEditScreenState extends ConsumerState<PatientEditScreen> {
  final _wifeName = TextEditingController();
  final _husbandName = TextEditingController();
  final _wifeAge = TextEditingController();
  final _husbandAge = TextEditingController();
  final _cycleId = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cycle = ref.read(cycleFormProvider(widget.cycleId)).asData?.value;
    if (cycle != null) {
      _wifeName.text = cycle.wifeName;
      _husbandName.text = cycle.husbandName;
      _wifeAge.text = cycle.wifeAge.toString();
      _husbandAge.text = cycle.husbandAge.toString();
      _cycleId.text = cycle.cycleIdentifier ?? '';
    }
  }

  @override
  void dispose() {
    _wifeName.dispose();
    _husbandName.dispose();
    _wifeAge.dispose();
    _husbandAge.dispose();
    _cycleId.dispose();
    super.dispose();
  }

  void _save() {
    ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        wifeName: Value(_wifeName.text),
        husbandName: Value(_husbandName.text),
        wifeAge: Value(int.tryParse(_wifeAge.text) ?? 0),
        husbandAge: Value(int.tryParse(_husbandAge.text) ?? 0),
        cycleIdentifier: Value(_cycleId.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Patient')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LabeledField(label: 'Wife Name', controller: _wifeName, onChanged: (_) => _save()),
          LabeledField(label: 'Husband Name', controller: _husbandName, onChanged: (_) => _save()),
          Row(
            children: [
              Expanded(child: LabeledField(label: 'Wife Age', controller: _wifeAge, keyboardType: TextInputType.number, onChanged: (_) => _save())),
              const SizedBox(width: 12),
              Expanded(child: LabeledField(label: 'Husband Age', controller: _husbandAge, keyboardType: TextInputType.number, onChanged: (_) => _save())),
            ],
          ),
          LabeledField(label: 'Cycle Identifier', controller: _cycleId, onChanged: (_) => _save()),
        ],
      ),
    );
  }
}
