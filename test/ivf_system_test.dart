import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:my_ivf_lab/data/database/app_database.dart';
import 'package:my_ivf_lab/features/cycle_form/cycle_form_notifier.dart';
import 'package:my_ivf_lab/features/cycle_form/metrics_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ivf_lab/core/providers/database_provider.dart';
import 'package:drift/drift.dart';

void main() {
  group('IVF System Tests', () {
    late AppDatabase db;
    late ProviderContainer container;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
      container = ProviderContainer(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
        ],
      );
    });

    tearDown(() async {
      await db.close();
      container.dispose();
    });

    test('Database and DAO - Partial Update Persistence', () async {
      final id = await db.cyclesDao.insertCycle(IvfCyclesCompanion.insert(
        husbandName: 'John',
        wifeName: 'Jane',
        husbandAge: 35,
        wifeAge: 32,
      ));

      // Update ONLY semen volume
      await db.cyclesDao.updateCycle(IvfCyclesCompanion(
        id: Value(id),
        semenVolume: const Value(3.5),
      ));

      final cycle = await db.cyclesDao.getById(id);
      expect(cycle?.semenVolume, 3.5);
      expect(cycle?.wifeName, 'Jane'); // SHOULD NOT BE NULL
    });

    test('Metrics - Maturation Rate', () async {
      // 10 OCC, 8 MII -> 80%
      final id = await db.cyclesDao.insertCycle(IvfCyclesCompanion.insert(
        husbandName: 'H',
        wifeName: 'W',
        husbandAge: 30,
        wifeAge: 30,
        occRecovered: const Value(10),
        oocyteMii: const Value(8),
      ));

      // Wait for provider to load from DB
      await container.read(cycleFormProvider(id).future);

      final rate = container.read(maturationRateProvider(id));
      expect(rate, 0.8);
    });

    test('Observations - Day 1 Persistence', () async {
      final id = await db.cyclesDao.insertCycle(IvfCyclesCompanion.insert(
        husbandName: 'H',
        wifeName: 'W',
        husbandAge: 30,
        wifeAge: 30,
      ));

      await db.observationsDao.upsert(DayObservationsCompanion.insert(
        cycleId: id,
        dayNumber: 1,
        twoPN2PB: const Value(5),
      ));

      final obs = await db.observationsDao.getForDay(id, 1);
      expect(obs?.twoPN2PB, 5);
    });
  });
}
