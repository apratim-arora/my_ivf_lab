import 'package:drift/drift.dart';
import '../app_database.dart';

part 'cycles_dao.g.dart';

@DriftAccessor(tables: [IvfCycles])
class CyclesDao extends DatabaseAccessor<AppDatabase> with _$CyclesDaoMixin {
  CyclesDao(super.db);

  Stream<List<IvfCycle>> watchAll() => (select(
    ivfCycles,
  )..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();

  Stream<List<IvfCycle>> watchSearch(String query) {
    final q = '%${query.toLowerCase()}%';
    return (select(ivfCycles)
          ..where(
            (t) => t.husbandName.lower().like(q) | t.wifeName.lower().like(q),
          )
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  Stream<List<IvfCycle>> watchActive() =>
      (select(ivfCycles)
            ..where((t) => t.oocytePickupDate.isNotNull())
            ..orderBy([(t) => OrderingTerm.desc(t.oocytePickupDate)]))
          .watch();

  Future<int> insertCycle(IvfCyclesCompanion entry) =>
      into(ivfCycles).insert(entry);

  Future<bool> updateCycle(IvfCyclesCompanion entry) =>
      update(ivfCycles).replace(entry);

  Future<IvfCycle?> getById(int id) =>
      (select(ivfCycles)..where((t) => t.id.equals(id))).getSingleOrNull();
}
