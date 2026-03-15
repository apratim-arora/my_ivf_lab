import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/database/app_database.dart';

// TO MIGRATE: replace with @Riverpod(keepAlive: true) on a top-level function
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close()); //this methiod isnt defined
  return db;
});
