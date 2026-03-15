import '../database/app_database.dart';
import '../database/daos/blastocysts_dao.dart';

class BlastocystRepository {
  final BlastocystsDao _dao;
  BlastocystRepository(this._dao);

  Stream<List<BlastocystGrade>> watchForCycle(int cycleId) =>
      _dao.watchForCycle(cycleId);

  Future<void> replaceAll(
    int cycleId,
    List<BlastocystGradesCompanion> grades,
  ) => _dao.replaceAll(cycleId, grades);
}
