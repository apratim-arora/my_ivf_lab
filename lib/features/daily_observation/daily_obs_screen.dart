import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database/app_database.dart';
import '../../shared/widgets/section_card.dart';
import '../../shared/widgets/labeled_field.dart';
import '../daily_observation/daily_obs_notifier.dart';
import '../cycle_form/cycle_form_notifier.dart';
import 'blastocyst/blastocyst_notifier.dart';

class DailyObsScreen extends ConsumerWidget {
  final int cycleId;
  final int day;
  const DailyObsScreen({
    super.key,
    required this.cycleId,
    required this.day,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = (cycleId: cycleId, day: day);
    final obsAsync = ref.watch(dailyObsProvider(key));
    final notifier = ref.read(dailyObsProvider(key).notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Day $day Observations')),
      body: obsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (obs) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            if (day == 1)
              _Day1Form(cycleId: cycleId, obs: obs, notifier: notifier),
            if (day == 2)
              _Day2Form(cycleId: cycleId, obs: obs, notifier: notifier),
            if (day == 3)
              _Day3Form(cycleId: cycleId, obs: obs, notifier: notifier),
            if (day == 5)
              _Day5Form(cycleId: cycleId),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _Day5Form extends ConsumerWidget {
  final int cycleId;
  const _Day5Form({required this.cycleId});

  static const _grades = ['3AA', '4AA', '5AA', '3AB', '4AB', '3BB', '4BB', 'other'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycleNotifier = ref.read(cycleFormProvider(cycleId).notifier);
    final gradesAsync = ref.watch(blastocystProvider(cycleId));
    final editor = ref.read(blastocystEditorProvider(cycleId).notifier);

    return SectionCard(
      title: 'Blastocysts',
      icon: Icons.bubble_chart_outlined,
      initiallyExpanded: true,
      children: [
        LabeledField(
          label: 'Total Blastocysts (Option B)',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          initialValue: cycleAsync.asData?.value?.totalBlastocysts?.toString(),
          onChanged: (v) => cycleNotifier.save(
            IvfCyclesCompanion(totalBlastocysts: Value(int.tryParse(v))),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider()),
        Text('Individual Grades (Option A)', style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: 12),
        gradesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
          data: (grades) {
            final gradeMap = <String, int>{for (final g in grades) g.grade: g.count};
            return _GradeEditorInline(
              initialValues: gradeMap,
              grades: _grades,
              onSave: (map) => editor.saveGrades(map),
            );
          },
        ),
      ],
    );
  }
}

class _GradeEditorInline extends StatefulWidget {
  final Map<String, int> initialValues;
  final List<String> grades;
  final void Function(Map<String, int>) onSave;

  const _GradeEditorInline({
    required this.initialValues,
    required this.grades,
    required this.onSave,
  });

  @override
  State<_GradeEditorInline> createState() => _GradeEditorInlineState();
}

class _GradeEditorInlineState extends State<_GradeEditorInline> {
  late Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = {
      for (final g in widget.grades)
        g: TextEditingController(text: (widget.initialValues[g] ?? 0).toString()),
    };
  }

  @override
  void dispose() {
    for (final c in _controllers.values) c.dispose();
    super.dispose();
  }

  void _save() {
    final map = <String, int>{
      for (final e in _controllers.entries)
        if ((int.tryParse(e.value.text) ?? 0) > 0)
          e.key: int.parse(e.value.text),
    };
    widget.onSave(map);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: widget.grades.map((g) {
        return SizedBox(
          width: (MediaQuery.of(context).size.width - 64) / 3,
          child: TextField(
            controller: _controllers[g],
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(labelText: g, border: const OutlineInputBorder(), isDense: true),
            onChanged: (_) => _save(),
          ),
        );
      }).toList(),
    );
  }
}

class _Day1Form extends StatefulWidget {
  final int cycleId;
  final DayObservation? obs;
  final DailyObsNotifier notifier;
  const _Day1Form({required this.cycleId, required this.obs, required this.notifier});

  @override
  State<_Day1Form> createState() => _Day1FormState();
}

class _Day1FormState extends State<_Day1Form> {
  final _2pn = TextEditingController();
  final _2pb = TextEditingController();
  final _necro = TextEditingController();

  @override
  void initState() {
    super.initState();
    _2pn.text = widget.obs?.twoPN2PB?.toString() ?? '';
    _2pb.text = widget.obs?.twoPBOnly?.toString() ?? '';
    _necro.text = widget.obs?.necrotic?.toString() ?? '';
  }

  @override
  void dispose() {
    _2pn.dispose();
    _2pb.dispose();
    _necro.dispose();
    super.dispose();
  }

  void _save() {
    widget.notifier.save(DayObservationsCompanion(
      cycleId: Value(widget.cycleId),
      dayNumber: const Value(1),
      twoPN2PB: Value(int.tryParse(_2pn.text)),
      twoPBOnly: Value(int.tryParse(_2pb.text)),
      necrotic: Value(int.tryParse(_necro.text)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Day 1 — Fertilization',
      icon: Icons.looks_one_outlined,
      initiallyExpanded: true,
      children: [
        LabeledField(label: '2PN 2PB Embryos', controller: _2pn, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '2PB Only', controller: _2pb, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: 'Necrotic', controller: _necro, keyboardType: TextInputType.number, onChanged: (_) => _save()),
      ],
    );
  }
}

class _Day2Form extends StatefulWidget {
  final int cycleId;
  final DayObservation? obs;
  final DailyObsNotifier notifier;
  const _Day2Form({required this.cycleId, required this.obs, required this.notifier});

  @override
  State<_Day2Form> createState() => _Day2FormState();
}

class _Day2FormState extends State<_Day2Form> {
  final _2pnArr = TextEditingController();
  final _4cellG1 = TextEditingController();
  final _4cellG2 = TextEditingController();
  final _2cell = TextEditingController();
  final _3cell = TextEditingController();
  final _5cell = TextEditingController();

  @override
  void initState() {
    super.initState();
    _2pnArr.text = widget.obs?.twoPNArrest?.toString() ?? '';
    _4cellG1.text = widget.obs?.fourCellG1?.toString() ?? '';
    _4cellG2.text = widget.obs?.fourCellG2?.toString() ?? '';
    _2cell.text = widget.obs?.twoCells?.toString() ?? '';
    _3cell.text = widget.obs?.threeCells?.toString() ?? '';
    _5cell.text = widget.obs?.fiveCells?.toString() ?? '';
  }

  @override
  void dispose() {
    for (final c in [_2pnArr, _4cellG1, _4cellG2, _2cell, _3cell, _5cell]) c.dispose();
    super.dispose();
  }

  void _save() {
    widget.notifier.save(DayObservationsCompanion(
      cycleId: Value(widget.cycleId),
      dayNumber: const Value(2),
      twoPNArrest: Value(int.tryParse(_2pnArr.text)),
      fourCellG1: Value(int.tryParse(_4cellG1.text)),
      fourCellG2: Value(int.tryParse(_4cellG2.text)),
      twoCells: Value(int.tryParse(_2cell.text)),
      threeCells: Value(int.tryParse(_3cell.text)),
      fiveCells: Value(int.tryParse(_5cell.text)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Day 2 — Cleavage',
      icon: Icons.looks_two_outlined,
      initiallyExpanded: true,
      children: [
        LabeledField(label: '2PN Arrest', controller: _2pnArr, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '4-Cell G1', controller: _4cellG1, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '4-Cell G2', controller: _4cellG2, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '2-Cell', controller: _2cell, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '3-Cell', controller: _3cell, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '5-Cell', controller: _5cell, keyboardType: TextInputType.number, onChanged: (_) => _save()),
      ],
    );
  }
}

class _Day3Form extends StatefulWidget {
  final int cycleId;
  final DayObservation? obs;
  final DailyObsNotifier notifier;
  const _Day3Form({required this.cycleId, required this.obs, required this.notifier});

  @override
  State<_Day3Form> createState() => _Day3FormState();
}

class _Day3FormState extends State<_Day3Form> {
  final _8cellG1 = TextEditingController();
  final _8cellG2 = TextEditingController();
  final _4cellArr = TextEditingController();

  @override
  void initState() {
    super.initState();
    _8cellG1.text = widget.obs?.eightCellG1?.toString() ?? '';
    _8cellG2.text = widget.obs?.eightCellG2?.toString() ?? '';
    _4cellArr.text = widget.obs?.fourCellArrest?.toString() ?? '';
  }

  @override
  void dispose() {
    for (final c in [_8cellG1, _8cellG2, _4cellArr]) c.dispose();
    super.dispose();
  }

  void _save() {
    widget.notifier.save(DayObservationsCompanion(
      cycleId: Value(widget.cycleId),
      dayNumber: const Value(3),
      eightCellG1: Value(int.tryParse(_8cellG1.text)),
      eightCellG2: Value(int.tryParse(_8cellG2.text)),
      fourCellArrest: Value(int.tryParse(_4cellArr.text)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Day 3 — Cleavage',
      icon: Icons.looks_3_outlined,
      initiallyExpanded: true,
      children: [
        LabeledField(label: '8-Cell G1', controller: _8cellG1, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '8-Cell G2', controller: _8cellG2, keyboardType: TextInputType.number, onChanged: (_) => _save()),
        LabeledField(label: '4-Cell Arrest', controller: _4cellArr, keyboardType: TextInputType.number, onChanged: (_) => _save()),
      ],
    );
  }
}
