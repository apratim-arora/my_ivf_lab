import '../database/app_database.dart';
import '../database/daos/observations_dao.dart';

class ObservationRepository {
  final ObservationsDao _dao;
  ObservationRepository(this._dao);

  Stream<List<DayObservation>> watchForCycle(int cycleId) =>
      _dao.watchForCycle(cycleId);

  Future<DayObservation?> getForDay(int cycleId, int day) =>
      _dao.getForDay(cycleId, day);

  Future<void> upsert(DayObservationsCompanion entry) => _dao.upsert(entry);

  Future<void> patch(int cycleId, int day, DayObservationsCompanion entry) =>
      _dao.patch(cycleId, day, entry);
}
