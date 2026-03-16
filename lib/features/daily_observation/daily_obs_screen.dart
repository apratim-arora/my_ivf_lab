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
      appBar: AppBar(title: Text('Day $day observations')),
      body: obsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (obs) => ListView(
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

  static const _grades = [
    '3AA',
    '4AA',
    '5AA',
    '3AB',
    '4AB',
    '3BB',
    '4BB',
    'other',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final cycleNotifier = ref.read(cycleFormProvider(cycleId).notifier);
    final gradesAsync = ref.watch(blastocystProvider(cycleId));
    final editor = ref.read(blastocystEditorProvider(cycleId).notifier);

    return SectionCard(
      title: 'Day 5 — Blastocysts',
      icon: Icons.bubble_chart_outlined,
      initiallyExpanded: true,
      isComplete:
          (cycle?.totalBlastocysts != null) ||
          (gradesAsync.asData?.value.isNotEmpty ?? false),
      children: [
        LabeledField(
          label: 'Total Blastocysts (Option B)',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          initialValue: cycle?.totalBlastocysts?.toString(),
          onChanged: (v) => cycleNotifier.save(
            IvfCyclesCompanion(totalBlastocysts: Value(int.tryParse(v))),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(),
        ),
        Text(
          'Individual Grades (Option A)',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
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
        g: TextEditingController(
          text: (widget.initialValues[g] ?? 0).toString(),
        ),
    };
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
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
    return Column(
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: widget.grades.map((g) {
            return SizedBox(
              width: 80,
              child: TextField(
                controller: _controllers[g],
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: g,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                onChanged: (_) {
                  _save();
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _Day1Form extends ConsumerWidget {
  final int cycleId;
  final DayObservation? obs;
  final DailyObsNotifier notifier;
  const _Day1Form({
    required this.cycleId,
    required this.obs,
    required this.notifier,
  });

  void _save(DayObservationsCompanion c) => notifier.save(c);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleAsync = ref.watch(cycleFormProvider(cycleId));
    final cycle = cycleAsync.asData?.value;
    final mii = cycle?.oocyteMii ?? 0;
    final totalDay1 = (obs?.twoPN2PB ?? 0) + (obs?.twoPBOnly ?? 0) + (obs?.necrotic ?? 0);
    final showWarning = cycle?.oocyteMii != null && totalDay1 > mii;

    return SectionCard(
      title: 'Day 1 — Fertilization',
      icon: Icons.looks_one_outlined,
      initiallyExpanded: true,
      isComplete: obs != null,
      children: [
        if (showWarning)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange[700]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.orange[700]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Warning: Total Day 1 embryos ($totalDay1) exceeds injected oocytes (MII: $mii)',
                      style: TextStyle(color: Colors.orange[700], fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        LabeledField(
          label: '2PN 2PB embryos',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          initialValue: obs?.twoPN2PB?.toString(),
          onChanged: (v) => _save(
            DayObservationsCompanion(
              cycleId: Value(cycleId),
              dayNumber: const Value(1),
              twoPN2PB: Value(int.tryParse(v)),
            ),
          ),
        ),
        LabeledField(
          label: '2PB only',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          initialValue: obs?.twoPBOnly?.toString(),
          onChanged: (v) => _save(
            DayObservationsCompanion(
              cycleId: Value(cycleId),
              dayNumber: const Value(1),
              twoPBOnly: Value(int.tryParse(v)),
            ),
          ),
        ),
        LabeledField(
          label: 'Necrotic',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          initialValue: obs?.necrotic?.toString(),
          onChanged: (v) => _save(
            DayObservationsCompanion(
              cycleId: Value(cycleId),
              dayNumber: const Value(1),
              necrotic: Value(int.tryParse(v)),
            ),
          ),
        ),
      ],
    );
  }
}

class _Day2Form extends StatelessWidget {
  final int cycleId;
  final DayObservation? obs;
  final DailyObsNotifier notifier;
  const _Day2Form({
    required this.cycleId,
    required this.obs,
    required this.notifier,
  });

  void _save(DayObservationsCompanion c) => notifier.save(c);

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Day 2 — Cleavage',
      icon: Icons.looks_two_outlined,
      initiallyExpanded: true,
      isComplete: obs != null,
      children: [
        for (final entry in [
          (
            '2PN arrest',
            obs?.twoPNArrest,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(2),
                twoPNArrest: Value(int.tryParse(v)),
              ),
            ),
          ),
          (
            '4-cell G1',
            obs?.fourCellG1,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(2),
                fourCellG1: Value(int.tryParse(v)),
              ),
            ),
          ),
          (
            '4-cell G2',
            obs?.fourCellG2,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(2),
                fourCellG2: Value(int.tryParse(v)),
              ),
            ),
          ),
          (
            '2-cell',
            obs?.twoCells,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(2),
                twoCells: Value(int.tryParse(v)),
              ),
            ),
          ),
          (
            '3-cell',
            obs?.threeCells,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(2),
                threeCells: Value(int.tryParse(v)),
              ),
            ),
          ),
          (
            '5-cell',
            obs?.fiveCells,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(2),
                fiveCells: Value(int.tryParse(v)),
              ),
            ),
          ),
        ])
          LabeledField(
            label: entry.$1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            initialValue: entry.$2?.toString(),
            onChanged: entry.$3,
          ),
      ],
    );
  }
}

class _Day3Form extends StatelessWidget {
  final int cycleId;
  final DayObservation? obs;
  final DailyObsNotifier notifier;
  const _Day3Form({
    required this.cycleId,
    required this.obs,
    required this.notifier,
  });

  void _save(DayObservationsCompanion c) => notifier.save(c);

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Day 3 — Cleavage',
      icon: Icons.looks_3_outlined,
      initiallyExpanded: true,
      isComplete: obs != null,
      children: [
        for (final entry in [
          (
            '8-cell G1',
            obs?.eightCellG1,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(3),
                eightCellG1: Value(int.tryParse(v)),
              ),
            ),
          ),
          (
            '8-cell G2',
            obs?.eightCellG2,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(3),
                eightCellG2: Value(int.tryParse(v)),
              ),
            ),
          ),
          (
            '4-cell arrest',
            obs?.fourCellArrest,
            (String v) => _save(
              DayObservationsCompanion(
                cycleId: Value(cycleId),
                dayNumber: const Value(3),
                fourCellArrest: Value(int.tryParse(v)),
              ),
            ),
          ),
        ])
          LabeledField(
            label: entry.$1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            initialValue: entry.$2?.toString(),
            onChanged: entry.$3,
          ),
      ],
    );
  }
}
