import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

final blastocystProvider = StreamProvider.family<List<BlastocystGrade>, int>(
  (ref, cycleId) =>
      ref.watch(blastocystRepositoryProvider).watchForCycle(cycleId),
);

// Notifier for editing grades
final blastocystEditorProvider =
    AsyncNotifierProvider.family<BlastocystEditorNotifier, void, int>(
      BlastocystEditorNotifier.new,
    );

class BlastocystEditorNotifier extends FamilyAsyncNotifier<void, int> {
  @override
  Future<void> build(int arg) async {}

  Future<void> saveGrades(Map<String, int> gradeMap) async {
    final entries = gradeMap.entries
        .where((e) => e.value > 0)
        .map(
          (e) => BlastocystGradesCompanion.insert(
            cycleId: arg,
            grade: e.key,
            count: Value(e.value),
          ),
        )
        .toList();
    await ref.read(blastocystRepositoryProvider).replaceAll(arg, entries);
  }
}
