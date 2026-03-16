import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../cycle_form/cycle_form_notifier.dart';

class TreatmentEditScreen extends ConsumerStatefulWidget {
  final int cycleId;
  const TreatmentEditScreen({super.key, required this.cycleId});

  @override
  ConsumerState<TreatmentEditScreen> createState() => _TreatmentEditScreenState();
}

class _TreatmentEditScreenState extends ConsumerState<TreatmentEditScreen> {
  String? _type;
  final _otherType = TextEditingController();
  final _protocol = TextEditingController();

  static const _options = [
    'Primary infertility',
    'Secondary infertility',
    'Donor cycle',
    'Freeze-all cycle',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    final cycle = ref.read(cycleFormProvider(widget.cycleId)).asData?.value;
    if (cycle != null) {
      _type = cycle.infertilityType;
      _otherType.text = cycle.otherInfertilityType ?? '';
      _protocol.text = cycle.stimProtocol ?? '';
    }
  }

  @override
  void dispose() {
    _otherType.dispose();
    _protocol.dispose();
    super.dispose();
  }

  void _save() {
    ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        infertilityType: Value(_type),
        otherInfertilityType: Value(_otherType.text.isEmpty ? null : _otherType.text),
        stimProtocol: Value(_protocol.text.isEmpty ? null : _protocol.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Treatment')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<String>(
            initialValue: _options.contains(_type) ? _type : null,
            decoration: const InputDecoration(
              labelText: 'Infertility Type',
              border: OutlineInputBorder(),
            ),
            items: _options
                .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                .toList(),
            onChanged: (v) {
              setState(() => _type = v);
              _save();
            },
          ),
          if (_type == 'Other')
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: _otherType,
                decoration: const InputDecoration(labelText: 'Specify Type', border: OutlineInputBorder()),
                onChanged: (_) => _save(),
              ),
            ),
          const SizedBox(height: 16),
          TextField(
            controller: _protocol,
            decoration: const InputDecoration(labelText: 'Stimulation Protocol', border: OutlineInputBorder()),
            onChanged: (_) => _save(),
          ),
        ],
      ),
    );
  }
}
