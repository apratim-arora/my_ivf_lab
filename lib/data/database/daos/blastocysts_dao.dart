import 'package:drift/drift.dart';
import '../app_database.dart';

part 'blastocysts_dao.g.dart';

@DriftAccessor(tables: [BlastocystGrades])
class BlastocystsDao extends DatabaseAccessor<AppDatabase>
    with _$BlastocystsDaoMixin {
  BlastocystsDao(super.db);

  Stream<List<BlastocystGrade>> watchForCycle(int cycleId) => (select(
    blastocystGrades,
  )..where((t) => t.cycleId.equals(cycleId))).watch();

  Future<void> replaceAll(
    int cycleId,
    List<BlastocystGradesCompanion> grades,
  ) async {
    await transaction(() async {
      await (delete(
        blastocystGrades,
      )..where((t) => t.cycleId.equals(cycleId))).go();
      if (grades.isNotEmpty) {
        await batch((b) => b.insertAll(blastocystGrades, grades));
      }
    });
  }
}
