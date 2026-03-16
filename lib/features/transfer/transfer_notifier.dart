import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

final transferProvider = StreamProvider.family<EmbryoTransfer?, int>(
  (ref, cycleId) =>
      ref.watch(transferRepositoryProvider).watchForCycle(cycleId),
);

class TransferEditorNotifier extends AsyncNotifier<void> {
  final int cycleIdArg;
  TransferEditorNotifier(this.cycleIdArg);

  @override
  FutureOr<void> build() async {}

  Future<void> save({
    int? embryosTransferred,
    DateTime? transferDate,
    int? embryosFrozen,
    String? cryoDevice,
  }) async {
    final repo = ref.read(transferRepositoryProvider);
    await repo.upsert(
          EmbryoTransfersCompanion(
            cycleId: Value(cycleIdArg),
            embryosTransferred: Value(embryosTransferred),
            transferDate: Value(transferDate),
            embryosFrozen: Value(embryosFrozen),
            cryoDevice: Value(cryoDevice),
          ),
        );
  }
}

final transferEditorProvider =
    AsyncNotifierProvider.family<TransferEditorNotifier, void, int>(
      (arg) => TransferEditorNotifier(arg),
    );
