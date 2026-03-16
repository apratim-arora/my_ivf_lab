import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  // No explicit close on onDispose needed for standard web/mobile drift usage
  // as it handles connections automatically, but we keep it clean.
  ref.onDispose(() => db.close());
  return db;
});
