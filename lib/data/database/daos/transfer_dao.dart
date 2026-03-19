import 'package:drift/drift.dart';
import '../app_database.dart';

part 'transfer_dao.g.dart';

@DriftAccessor(tables: [EmbryoTransfers])
class TransferDao extends DatabaseAccessor<AppDatabase>
    with _$TransferDaoMixin {
  TransferDao(super.db);

  Stream<EmbryoTransfer?> watchForCycle(int cycleId) => (select(
    embryoTransfers,
  )..where((t) => t.cycleId.equals(cycleId)))
      .watch()
      .map((rows) => rows.isEmpty ? null : rows.first);

  Future<void> upsert(EmbryoTransfersCompanion entry) =>
      into(embryoTransfers).insertOnConflictUpdate(entry);
}
