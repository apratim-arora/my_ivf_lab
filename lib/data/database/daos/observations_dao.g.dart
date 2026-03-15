// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observations_dao.dart';

// ignore_for_file: type=lint
mixin _$ObservationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $IvfCyclesTable get ivfCycles => attachedDatabase.ivfCycles;
  $DayObservationsTable get dayObservations => attachedDatabase.dayObservations;
  ObservationsDaoManager get managers => ObservationsDaoManager(this);
}

class ObservationsDaoManager {
  final _$ObservationsDaoMixin _db;
  ObservationsDaoManager(this._db);
  $$IvfCyclesTableTableManager get ivfCycles =>
      $$IvfCyclesTableTableManager(_db.attachedDatabase, _db.ivfCycles);
  $$DayObservationsTableTableManager get dayObservations =>
      $$DayObservationsTableTableManager(
        _db.attachedDatabase,
        _db.dayObservations,
      );
}
