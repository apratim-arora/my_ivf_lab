import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/cycles_dao.dart';
import 'daos/observations_dao.dart';
import 'daos/blastocysts_dao.dart';
import 'daos/transfer_dao.dart';

part 'app_database.g.dart';

class IvfCycles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cycleIdentifier => text().nullable()();
  TextColumn get husbandName => text()();
  TextColumn get wifeName => text()();
  IntColumn get husbandAge => integer()();
  IntColumn get wifeAge => integer()();
  RealColumn get amh => real().nullable()();
  RealColumn get bmi => real().nullable()();
  TextColumn get infertilityType => text().nullable()();
  TextColumn get otherInfertilityType => text().nullable()();
  TextColumn get stimProtocol => text().nullable()();
  RealColumn get semenVolume => real().nullable()();
  RealColumn get spermConc => real().nullable()();
  RealColumn get motilityFp => real().nullable()();
  RealColumn get motilitySp => real().nullable()();
  RealColumn get motilityIm => real().nullable()();
  DateTimeColumn get oocytePickupDate => dateTime().nullable()();
  TextColumn get oocytePickupTime => text().nullable()();
  TextColumn get icsiTime => text().nullable()();
  IntColumn get occRecovered => integer().nullable()();
  IntColumn get oocyteMii => integer().nullable()();
  IntColumn get oocyteMi => integer().nullable()();
  IntColumn get oocyteGv => integer().nullable()();
  IntColumn get totalBlastocysts => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class DayObservations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cycleId => integer().references(IvfCycles, #id)();
  IntColumn get dayNumber => integer()();

  // Day 1
  IntColumn get twoPN2PB => integer().nullable()();
  IntColumn get twoPBOnly => integer().nullable()();
  IntColumn get necrotic => integer().nullable()();

  // Day 2
  IntColumn get twoPNArrest => integer().nullable()();
  IntColumn get fourCellG1 => integer().nullable()();
  IntColumn get fourCellG2 => integer().nullable()();
  IntColumn get twoCells => integer().nullable()();
  IntColumn get threeCells => integer().nullable()();
  IntColumn get fiveCells => integer().nullable()();

  // Day 3
  IntColumn get eightCellG1 => integer().nullable()();
  IntColumn get eightCellG2 => integer().nullable()();
  IntColumn get fourCellArrest => integer().nullable()();

  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {cycleId, dayNumber},
  ];
}

class BlastocystGrades extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cycleId => integer().references(IvfCycles, #id)();
  TextColumn get grade => text()();
  IntColumn get count => integer().withDefault(const Constant(0))();
}

class EmbryoTransfers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cycleId => integer().references(IvfCycles, #id)();
  IntColumn get embryosTransferred => integer().nullable()();
  DateTimeColumn get transferDate => dateTime().nullable()();
  IntColumn get embryosFrozen => integer().nullable()();
  TextColumn get cryoDevice => text().nullable()();
}

@DriftDatabase(
  tables: [IvfCycles, DayObservations, BlastocystGrades, EmbryoTransfers],
  daos: [CyclesDao, ObservationsDao, BlastocystsDao, TransferDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'embryology_v2')); // Changed name to force fresh start

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      // In a real lab app, we'd handle each change.
      // For this initial setup phase, if v1 exists, we just recreate to be safe.
      if (from < 2) {
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
        }
        await m.createAll();
      }
    },
  );
}
