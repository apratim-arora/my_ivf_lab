import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

typedef DayKey = ({int cycleId, int day});

class DailyObsNotifier extends AsyncNotifier<DayObservation?> {
  final DayKey dayKeyArg;
  DailyObsNotifier(this.dayKeyArg);

  @override
  FutureOr<DayObservation?> build() async {
    final repo = ref.watch(observationRepositoryProvider);
    return repo.getForDay(dayKeyArg.cycleId, dayKeyArg.day);
  }

  Future<void> save(DayObservationsCompanion entry) async {
    final repo = ref.read(observationRepositoryProvider);
    await repo.upsert(entry);
    final updated = await repo.getForDay(dayKeyArg.cycleId, dayKeyArg.day);
    state = AsyncData(updated);
  }
}

final dailyObsProvider =
    AsyncNotifierProvider.family<DailyObsNotifier, DayObservation?, DayKey>(
      (arg) => DailyObsNotifier(arg),
    );
