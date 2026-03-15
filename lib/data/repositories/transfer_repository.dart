import '../database/app_database.dart';
import '../database/daos/transfer_dao.dart';

class TransferRepository {
  final TransferDao _dao;
  TransferRepository(this._dao);

  Stream<EmbryoTransfer?> watchForCycle(int cycleId) =>
      _dao.watchForCycle(cycleId);

  Future<void> upsert(EmbryoTransfersCompanion entry) => _dao.upsert(entry);
}
