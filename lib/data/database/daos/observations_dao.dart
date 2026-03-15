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
}
