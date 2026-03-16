import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:my_ivf_lab/data/database/app_database.dart';

void main() {
  test('Smoke test - Database and DAO', () async {
    final db = AppDatabase(NativeDatabase.memory());

    final cycles = await db.cyclesDao.watchAll().first;
    expect(cycles, isEmpty);

    await db.cyclesDao.insertCycle(IvfCyclesCompanion.insert(
      husbandName: 'John',
      wifeName: 'Jane',
      husbandAge: 35,
      wifeAge: 32,
    ));

    final cyclesAfter = await db.cyclesDao.watchAll().first;
    expect(cyclesAfter.length, 1);
    expect(cyclesAfter.first.wifeName, 'Jane');

    await db.close();
  });
}
