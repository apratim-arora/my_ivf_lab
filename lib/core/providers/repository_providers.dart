import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/cycle_repository.dart';
import '../../data/repositories/observation_repository.dart';
import '../../data/repositories/blastocyst_repository.dart';
import '../../data/repositories/transfer_repository.dart';
import 'database_provider.dart';

// TO MIGRATE: each becomes @Riverpod(keepAlive: true) function
final cycleRepositoryProvider = Provider<CycleRepository>(
  (ref) => CycleRepository(ref.watch(appDatabaseProvider).cyclesDao),
);

final observationRepositoryProvider = Provider<ObservationRepository>(
  (ref) =>
      ObservationRepository(ref.watch(appDatabaseProvider).observationsDao),
);

final blastocystRepositoryProvider = Provider<BlastocystRepository>(
  (ref) => BlastocystRepository(ref.watch(appDatabaseProvider).blastocystsDao),
);

final transferRepositoryProvider = Provider<TransferRepository>(
  (ref) => TransferRepository(ref.watch(appDatabaseProvider).transferDao),
);
