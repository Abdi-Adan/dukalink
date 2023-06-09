// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:dukalink/infrastructure/local_repository/migrations.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<T> initDatabase<T extends DatabaseExecutor>(String dbName) async {
  final String _dbPath = await getDatabasesPath();
  final String _path = join(_dbPath, dbName);
  return await openDatabase(
    _path,
    version: migrations.length + 1,
    onCreate: onCreateCallback,
    onUpgrade: onUpgradeCallback,
  ) as T;
}

Future<void> onCreateCallback(Database db, int version) async {
  await migrate(db, 0, version);
}

Future<void> onUpgradeCallback(
    Database db, int oldVersion, int newVersion) async {
  await migrate(db, oldVersion, newVersion);
}

Future<void> migrate(Database db, int oldVersion, int newVersion) async {
  final logger = Logger();
  for (int i = oldVersion; i <= newVersion - 2; i++) {
    try {
      await db.execute(migrations[i]);
    } catch (e) {
      logger.e('Error executing migration ${migrations[i]}');
    }
  }
}

Future<void> clearDatabaseHelper(String dbName) async {
  final String _dbPath = await getDatabasesPath();
  final String _path = join(_dbPath, dbName);
  deleteDatabase(_path);
}
