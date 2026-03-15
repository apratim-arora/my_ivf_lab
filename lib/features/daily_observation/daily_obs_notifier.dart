import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

// Family param: (cycleId, dayNumber)
typedef DayKey = ({int cycleId, int day});

final dailyObsProvider =
    AsyncNotifierProvider.family<DailyObsNotifier, DayObservation?, DayKey>(
      DailyObsNotifier.new,
    );

class DailyObsNotifier extends FamilyAsyncNotifier<DayObservation?, DayKey> {
  @override
  Future<DayObservation?> build(DayKey arg) =>
      ref.read(observationRepositoryProvider).getForDay(arg.cycleId, arg.day);

  Future<void> save(DayObservationsCompanion entry) async {
    final repo = ref.read(observationRepositoryProvider);
    await repo.upsert(entry);
    state = AsyncData(await repo.getForDay(arg.cycleId, arg.day));
  }
}
