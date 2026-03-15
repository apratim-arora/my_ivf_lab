// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blastocysts_dao.dart';

// ignore_for_file: type=lint
mixin _$BlastocystsDaoMixin on DatabaseAccessor<AppDatabase> {
  $IvfCyclesTable get ivfCycles => attachedDatabase.ivfCycles;
  $BlastocystGradesTable get blastocystGrades =>
      attachedDatabase.blastocystGrades;
  BlastocystsDaoManager get managers => BlastocystsDaoManager(this);
}

class BlastocystsDaoManager {
  final _$BlastocystsDaoMixin _db;
  BlastocystsDaoManager(this._db);
  $$IvfCyclesTableTableManager get ivfCycles =>
      $$IvfCyclesTableTableManager(_db.attachedDatabase, _db.ivfCycles);
  $$BlastocystGradesTableTableManager get blastocystGrades =>
      $$BlastocystGradesTableTableManager(
        _db.attachedDatabase,
        _db.blastocystGrades,
      );
}
