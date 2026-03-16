import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/cycles_dao.dart';
import 'daos/observations_dao.dart';
import 'daos/blastocysts_dao.dart';
import 'daos/transfer_dao.dart';

part 'app_database.g.dart';

class IvfCycles extends Table {
  late final id = integer().autoIncrement()();
  late final cycleIdentifier = text().nullable()();
  late final husbandName = text()();
  late final wifeName = text()();
  late final husbandAge = integer()();
  late final wifeAge = integer()();
  late final amh = real().nullable()();
  late final bmi = real().nullable()();
  late final infertilityType = text().nullable()();
  late final otherInfertilityType = text().nullable()();
  late final stimProtocol = text().nullable()();
  late final semenVolume = real().nullable()();
  late final spermConc = real().nullable()();
  late final motilityFp = real().nullable()();
  late final motilitySp = real().nullable()();
  late final motilityIm = real().nullable()();
  late final oocytePickupDate = dateTime().nullable()();
  late final oocytePickupTime = text().nullable()();
  late final icsiTime = text().nullable()();
  late final occRecovered = integer().nullable()();
  late final oocyteMii = integer().nullable()();
  late final oocyteMi = integer().nullable()();
  late final oocyteGv = integer().nullable()();
  late final totalBlastocysts = integer().nullable()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class DayObservations extends Table {
  late final id = integer().autoIncrement()();
  late final cycleId = integer().references(IvfCycles, #id)();
  late final dayNumber = integer()();
  // Day 1
  late final twoPN2PB = integer().nullable()();
  late final twoPBOnly = integer().nullable()();
  late final necrotic = integer().nullable()();
  // Day 2
  late final twoPNArrest = integer().nullable()();
  late final fourCellG1 = integer().nullable()();
  late final fourCellG2 = integer().nullable()();
  late final twoCells = integer().nullable()();
  late final threeCells = integer().nullable()();
  late final fiveCells = integer().nullable()();
  // Day 3
  late final eightCellG1 = integer().nullable()();
  late final eightCellG2 = integer().nullable()();
  late final fourCellArrest = integer().nullable()();
  late final recordedAt = dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {cycleId, dayNumber},
  ];
}

class BlastocystGrades extends Table {
  late final id = integer().autoIncrement()();
  late final cycleId = integer().references(IvfCycles, #id)();
  late final grade = text()();
  late final count = integer().withDefault(const Constant(0))();
}

class EmbryoTransfers extends Table {
  late final id = integer().autoIncrement()();
  late final cycleId = integer().references(IvfCycles, #id)();
  late final embryosTransferred = integer().nullable()();
  late final transferDate = dateTime().nullable()();
  late final embryosFrozen = integer().nullable()();
  late final cryoDevice = text().nullable()();
}

@DriftDatabase(
  tables: [IvfCycles, DayObservations, BlastocystGrades, EmbryoTransfers],
  daos: [CyclesDao, ObservationsDao, BlastocystsDao, TransferDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'embryology'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(onCreate: (m) => m.createAll());
}
