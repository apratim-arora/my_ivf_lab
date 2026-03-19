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
  bool _initialized = false;

  @override
  void dispose() {
    _wifeName.dispose();
    _husbandName.dispose();
    _wifeAge.dispose();
    _husbandAge.dispose();
    _cycleId.dispose();
    super.dispose();
  }

  void _sync(IvfCycle cycle) {
    if (_initialized) return;
    _wifeName.text = cycle.wifeName;
    _husbandName.text = cycle.husbandName;
    _wifeAge.text = cycle.wifeAge.toString();
    _husbandAge.text = cycle.husbandAge.toString();
    _cycleId.text = cycle.cycleIdentifier ?? '';
    _initialized = true;
  }

  Future<void> _save() async {
    await ref.read(cycleFormProvider(widget.cycleId).notifier).save(
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
    ref.listen<AsyncValue<IvfCycle?>>(cycleFormProvider(widget.cycleId), (prev, next) {
      next.whenData((cycle) {
        if (cycle != null && !_initialized) setState(() => _sync(cycle));
      });
    });

    final cycleAsync = ref.watch(cycleFormProvider(widget.cycleId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Identification'),
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
            padding: const EdgeInsets.all(24),
            children: [
              LabeledField(label: 'Wife Name', controller: _wifeName, onChanged: (_) => _save()),
              LabeledField(label: 'Husband Name', controller: _husbandName, onChanged: (_) => _save()),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: LabeledField(label: 'Wife Age', controller: _wifeAge, keyboardType: TextInputType.number, onChanged: (_) => _save())),
                  const SizedBox(width: 16),
                  Expanded(child: LabeledField(label: 'Husband Age', controller: _husbandAge, keyboardType: TextInputType.number, onChanged: (_) => _save())),
                ],
              ),
              const SizedBox(height: 12),
              LabeledField(label: 'Cycle Identifier', controller: _cycleId, hint: 'e.g. LAB-2024-001', onChanged: (_) => _save()),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () async {
                  await _save();
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Details saved')));
                  }
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
