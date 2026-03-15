import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/cycle_repository.dart';

part 'cycle_list_notifier.g.dart';

// keepAlive: false (default with codegen) — auto-disposes when screen leaves
@riverpod
Stream<List<IvfCycle>> cycleList(Ref ref, String searchQuery) {
  final repo = ref.watch(cycleRepositoryProvider);
  if (searchQuery.trim().isEmpty) return repo.watchAll();
  return repo.watchSearch(searchQuery.trim());
}
