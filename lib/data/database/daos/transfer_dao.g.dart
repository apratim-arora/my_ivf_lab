// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_dao.dart';

// ignore_for_file: type=lint
mixin _$TransferDaoMixin on DatabaseAccessor<AppDatabase> {
  $IvfCyclesTable get ivfCycles => attachedDatabase.ivfCycles;
  $EmbryoTransfersTable get embryoTransfers => attachedDatabase.embryoTransfers;
  TransferDaoManager get managers => TransferDaoManager(this);
}

class TransferDaoManager {
  final _$TransferDaoMixin _db;
  TransferDaoManager(this._db);
  $$IvfCyclesTableTableManager get ivfCycles =>
      $$IvfCyclesTableTableManager(_db.attachedDatabase, _db.ivfCycles);
  $$EmbryoTransfersTableTableManager get embryoTransfers =>
      $$EmbryoTransfersTableTableManager(
        _db.attachedDatabase,
        _db.embryoTransfers,
      );
}
