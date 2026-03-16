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

  @override
  void initState() {
    super.initState();
    final cycle = ref.read(cycleFormProvider(widget.cycleId)).asData?.value;
    if (cycle != null) {
      _occ.text = cycle.occRecovered?.toString() ?? '';
      _mii.text = cycle.oocyteMii?.toString() ?? '';
      _mi.text = cycle.oocyteMi?.toString() ?? '';
      _gv.text = cycle.oocyteGv?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    _occ.dispose();
    _mii.dispose();
    _mi.dispose();
    _gv.dispose();
    super.dispose();
  }

  void _save() {
    ref.read(cycleFormProvider(widget.cycleId).notifier).save(
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
    final mii = int.tryParse(_mii.text) ?? 0;
    final mi = int.tryParse(_mi.text) ?? 0;
    final gv = int.tryParse(_gv.text) ?? 0;
    final occ = int.tryParse(_occ.text) ?? 0;
    final showWarning = (mii + mi + gv) > occ;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Oocyte Retrieval')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          LabeledField(label: 'OCC Recovered', controller: _occ, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], onChanged: (_) => setState(() => _save())),
          const Divider(height: 32),
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
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.orange[700]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Warning: Sum of MII+MI+GV (${mii + mi + gv}) exceeds OCC recovered ($occ)',
                      style: TextStyle(color: Colors.orange[700], fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
