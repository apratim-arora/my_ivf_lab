// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycles_dao.dart';

// ignore_for_file: type=lint
mixin _$CyclesDaoMixin on DatabaseAccessor<AppDatabase> {
  $IvfCyclesTable get ivfCycles => attachedDatabase.ivfCycles;
  CyclesDaoManager get managers => CyclesDaoManager(this);
}

class CyclesDaoManager {
  final _$CyclesDaoMixin _db;
  CyclesDaoManager(this._db);
  $$IvfCyclesTableTableManager get ivfCycles =>
      $$IvfCyclesTableTableManager(_db.attachedDatabase, _db.ivfCycles);
}
