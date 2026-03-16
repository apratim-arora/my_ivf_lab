import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/database/app_database.dart';
import '../../../core/providers/repository_providers.dart';

final blastocystProvider = StreamProvider.family<List<BlastocystGrade>, int>(
  (ref, cycleId) =>
      ref.watch(blastocystRepositoryProvider).watchForCycle(cycleId),
);

class BlastocystEditorNotifier extends AsyncNotifier<void> {
  final int cycleIdArg;
  BlastocystEditorNotifier(this.cycleIdArg);

  @override
  FutureOr<void> build() async {}

  Future<void> saveGrades(Map<String, int> gradeMap) async {
    final entries = gradeMap.entries
        .where((e) => e.value > 0)
        .map(
          (e) => BlastocystGradesCompanion.insert(
            cycleId: cycleIdArg,
            grade: e.key,
            count: Value(e.value),
          ),
        )
        .toList();
    final repo = ref.read(blastocystRepositoryProvider);
    await repo.replaceAll(cycleIdArg, entries);
  }
}

final blastocystEditorProvider =
    AsyncNotifierProvider.family<BlastocystEditorNotifier, void, int>(
      (arg) => BlastocystEditorNotifier(arg),
    );
