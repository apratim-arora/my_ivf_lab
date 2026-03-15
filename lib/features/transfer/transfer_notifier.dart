import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

final transferProvider = StreamProvider.family<EmbryoTransfer?, int>(
  (ref, cycleId) =>
      ref.watch(transferRepositoryProvider).watchForCycle(cycleId),
);

final transferEditorProvider =
    AsyncNotifierProvider.family<TransferEditorNotifier, void, int>(
      TransferEditorNotifier.new,
    );

class TransferEditorNotifier extends FamilyAsyncNotifier<void, int> {
  @override
  Future<void> build(int arg) async {}

  Future<void> save({
    int? embryosTransferred,
    DateTime? transferDate,
    int? embryosFrozen,
    String? cryoDevice,
  }) async {
    await ref
        .read(transferRepositoryProvider)
        .upsert(
          EmbryoTransfersCompanion(
            cycleId: Value(arg),
            embryosTransferred: Value(embryosTransferred),
            transferDate: Value(transferDate),
            embryosFrozen: Value(embryosFrozen),
            cryoDevice: Value(cryoDevice),
          ),
        );
  }
}
