import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/widgets/section_card.dart';
import '../../shared/widgets/labeled_field.dart';
import '../daily_observation/daily_obs_notifier.dart';

class DailyObsScreen extends ConsumerWidget {
  final int cycleId;
  final int day;
  const DailyObsScreen({super.key, required this.cycleId, required this.day});

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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _Day1Form extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Day 1 — Fertilization',
      icon: Icons.looks_one_outlined,
      initiallyExpanded: true,
      isComplete: obs != null,
      children: [
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
