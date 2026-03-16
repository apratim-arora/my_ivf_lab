import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

class CycleFormNotifier extends AsyncNotifier<IvfCycle?> {
  final int? cycleIdArg;
  CycleFormNotifier(this.cycleIdArg);

  @override
  FutureOr<IvfCycle?> build() async {
    if (cycleIdArg == null) return null;
    final repo = ref.watch(cycleRepositoryProvider);
    return repo.getById(cycleIdArg!);
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
    final newItem = await repo.getById(id);
    state = AsyncData(newItem);
    return id;
  }

  Future<void> save(IvfCyclesCompanion updates) async {
    if (cycleIdArg == null) return;

    final repo = ref.read(cycleRepositoryProvider);
    await repo.save(updates.copyWith(id: Value(cycleIdArg!), updatedAt: Value(DateTime.now())));
    final updatedItem = await repo.getById(cycleIdArg!);
    state = AsyncData(updatedItem);
  }
}

final cycleFormProvider =
    AsyncNotifierProvider.family<CycleFormNotifier, IvfCycle?, int?>(
      (arg) => CycleFormNotifier(arg),
    );
