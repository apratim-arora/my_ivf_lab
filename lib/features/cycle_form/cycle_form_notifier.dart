import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

// TO MIGRATE: @riverpod class CycleFormNotifier extends _$CycleFormNotifier
final cycleFormProvider =
    AsyncNotifierProvider.family<CycleFormNotifier, IvfCycle?, int?>(
      CycleFormNotifier.new,
    );

class CycleFormNotifier extends FamilyAsyncNotifier<IvfCycle?, int?> {
  @override
  Future<IvfCycle?> build(int? arg) async {
    if (arg == null) return null;
    return ref.read(cycleRepositoryProvider).getById(arg);
  }

  Future<int> createCycle({
    required String husbandName,
    required String wifeName,
    required int husbandAge,
    required int wifeAge,
  }) async {
    final repo = ref.read(cycleRepositoryProvider);
    final id = await repo.create(
      husbandName: husbandName,
      wifeName: wifeName,
      husbandAge: husbandAge,
      wifeAge: wifeAge,
    );
    state = AsyncData(await repo.getById(id));
    return id;
  }

  Future<void> save(IvfCyclesCompanion updates) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final merged = current
        .toCompanion(true)
        .copyWith(
          amh: updates.amh,
          bmi: updates.bmi,
          infertilityType: updates.infertilityType,
          stimProtocol: updates.stimProtocol,
          semenVolume: updates.semenVolume,
          spermConc: updates.spermConc,
          motilityFp: updates.motilityFp,
          motilitySp: updates.motilitySp,
          motilityIm: updates.motilityIm,
          oocytePickupDate: updates.oocytePickupDate,
          oocytePickupTime: updates.oocytePickupTime,
          icsiTime: updates.icsiTime,
          occRecovered: updates.occRecovered,
          oocyteMii: updates.oocyteMii,
          oocyteMi: updates.oocyteMi,
          oocyteGv: updates.oocyteGv,
          updatedAt: Value(DateTime.now()),
        );
    final repo = ref.read(cycleRepositoryProvider);
    await repo.save(merged);
    state = AsyncData(await repo.getById(current.id));
  }

  // Derived metrics — computed in memory, never stored
  double? get maturationRate {
    final c = state.valueOrNull;
    if (c?.occRecovered == null || c?.oocyteMii == null) return null;
    if (c!.occRecovered! == 0) return 0;
    return c.oocyteMii! / c.occRecovered!;
  }

  double? fertilizationRate(int twoPN) {
    final c = state.valueOrNull;
    if (c?.oocyteMii == null || c!.oocyteMii! == 0) return null;
    return twoPN / c.oocyteMii!;
  }
}
