import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../cycle_form/cycle_form_notifier.dart';
import '../../shared/widgets/labeled_field.dart';

class SemenEditScreen extends ConsumerStatefulWidget {
  final int cycleId;
  const SemenEditScreen({super.key, required this.cycleId});

  @override
  ConsumerState<SemenEditScreen> createState() => _SemenEditScreenState();
}

class _SemenEditScreenState extends ConsumerState<SemenEditScreen> {
  final _volume = TextEditingController();
  final _conc = TextEditingController();
  final _fp = TextEditingController();
  final _sp = TextEditingController();
  final _im = TextEditingController();
  bool _initialized = false;

  @override
  void dispose() {
    _volume.dispose();
    _conc.dispose();
    _fp.dispose();
    _sp.dispose();
    _im.dispose();
    super.dispose();
  }

  void _sync(IvfCycle cycle) {
    if (_initialized) return;
    _volume.text = cycle.semenVolume?.toString() ?? '';
    _conc.text = cycle.spermConc?.toString() ?? '';
    _fp.text = cycle.motilityFp?.toString() ?? '';
    _sp.text = cycle.motilitySp?.toString() ?? '';
    _im.text = cycle.motilityIm?.toString() ?? '';
    _initialized = true;
  }

  void _save() {
    ref.read(cycleFormProvider(widget.cycleId).notifier).save(
      IvfCyclesCompanion(
        semenVolume: Value(double.tryParse(_volume.text)),
        spermConc: Value(double.tryParse(_conc.text)),
        motilityFp: Value(double.tryParse(_fp.text)),
        motilitySp: Value(double.tryParse(_sp.text)),
        motilityIm: Value(double.tryParse(_im.text)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cycleAsync = ref.watch(cycleFormProvider(widget.cycleId));
    cycleAsync.whenData((c) { if (c != null) _sync(c); });

    return Scaffold(
      appBar: AppBar(title: const Text('Semen Analysis')),
      body: cycleAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (_) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            LabeledField(label: 'Volume (ml)', controller: _volume, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
            LabeledField(label: 'Concentration (M/ml)', controller: _conc, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save()),
            const Divider(height: 40),
            Text('Motility (%)', style: Theme.of(context).textTheme.titleSmall),
            Row(
              children: [
                Expanded(child: LabeledField(label: 'FP', controller: _fp, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save())),
                const SizedBox(width: 8),
                Expanded(child: LabeledField(label: 'SP', controller: _sp, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save())),
                const SizedBox(width: 8),
                Expanded(child: LabeledField(label: 'IM', controller: _im, keyboardType: const TextInputType.numberWithOptions(decimal: true), onChanged: (_) => _save())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
