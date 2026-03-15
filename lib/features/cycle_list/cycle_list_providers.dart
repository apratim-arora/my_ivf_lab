import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';
import '../../core/providers/repository_providers.dart';

// TO MIGRATE: @riverpod Stream<List<IvfCycle>> cycleList(Ref ref, String q)
final cycleListProvider = StreamProvider.family<List<IvfCycle>, String>((
  ref,
  query,
) {
  final repo = ref.watch(cycleRepositoryProvider);
  if (query.trim().isEmpty) return repo.watchAll();
  return repo.watchSearch(query.trim());
});

// TO MIGRATE: @riverpod Stream<List<IvfCycle>> activeCycles(Ref ref)
final activeCyclesProvider = StreamProvider<List<IvfCycle>>(
  (ref) => ref.watch(cycleRepositoryProvider).watchActive(),
);
