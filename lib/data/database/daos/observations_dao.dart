import 'package:drift/drift.dart';
import '../app_database.dart';

part 'observations_dao.g.dart';

@DriftAccessor(tables: [DayObservations])
class ObservationsDao extends DatabaseAccessor<AppDatabase>
    with _$ObservationsDaoMixin {
  ObservationsDao(super.db);

  Stream<List<DayObservation>> watchForCycle(int cycleId) =>
      (select(dayObservations)
            ..where((t) => t.cycleId.equals(cycleId))
            ..orderBy([(t) => OrderingTerm.asc(t.dayNumber)]))
          .watch();

  Future<DayObservation?> getForDay(int cycleId, int day) =>
      (select(dayObservations)
            ..where((t) => t.cycleId.equals(cycleId) & t.dayNumber.equals(day)))
          .getSingleOrNull();

  Future<void> upsert(DayObservationsCompanion entry) =>
      into(dayObservations).insertOnConflictUpdate(entry);

  // Partial update based on cycleId and dayNumber
  Future<void> patch(int cycleId, int day, DayObservationsCompanion entry) async {
    final query = update(dayObservations)
      ..where((t) => t.cycleId.equals(cycleId) & t.dayNumber.equals(day));

    final count = await query.write(entry);
    if (count == 0) {
      // If row doesn't exist, create it with the provided fields
      await into(dayObservations).insert(entry.copyWith(
        cycleId: Value(cycleId),
        dayNumber: Value(day),
      ));
    }
  }
}
