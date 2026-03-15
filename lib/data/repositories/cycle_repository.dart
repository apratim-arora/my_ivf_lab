import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/daos/cycles_dao.dart';

class CycleRepository {
  final CyclesDao _dao;
  CycleRepository(this._dao);

  Stream<List<IvfCycle>> watchAll() => _dao.watchAll();
  Stream<List<IvfCycle>> watchSearch(String q) => _dao.watchSearch(q);
  Stream<List<IvfCycle>> watchActive() => _dao.watchActive();
  Future<IvfCycle?> getById(int id) => _dao.getById(id);

  Future<int> create({
    required String husbandName,
    required String wifeName,
    required int husbandAge,
    required int wifeAge,
  }) => _dao.insertCycle(
    IvfCyclesCompanion.insert(
      husbandName: husbandName,
      wifeName: wifeName,
      husbandAge: husbandAge,
      wifeAge: wifeAge,
    ),
  );

  Future<bool> save(IvfCyclesCompanion entry) => _dao.updateCycle(entry);
}
