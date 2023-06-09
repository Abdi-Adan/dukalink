// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:convert';
import 'package:dukalink/infrastructure/local_repository/database_base.dart';
import 'package:dukalink/infrastructure/local_repository/initialize_db.dart';
import 'package:dukalink/infrastructure/local_repository/sqlite.dart';
import 'package:sqflite/sqflite.dart';

class DukalinkDatabaseMobile<T extends DatabaseExecutor>
    implements DukalinkDatabaseBase<T> {
  DukalinkDatabaseMobile({this.initializeDB});

  final InitializeDB<T>? initializeDB;

  /// [database] creates and returns an instance of the database as a future
  @override
  Future<T> get database async {
    return initializeDB!.database();
  }

  /// As the name suggest its used for clearing the database
  @override
  Future<void> clearDatabase() =>
      clearDatabaseHelper(this.initializeDB!.dbName);

  /// Counts table records in the database
  @override
  Future<int> countTableRecords(Tables table) async {
    final T _db = await this.database;
    final int? count = Sqflite.firstIntValue(
        await _db.rawQuery('SELECT COUNT(*) FROM ${table.name}'));
    return Future<int>.value(count);
  }

  /// Used to verify if database has any table records based on existing table definitiona in the [Tables] enum
  @override
  Future<bool> isDatabaseEmpty() async {
    final int t1 = await countTableRecords(Tables.userState);

    final int counts = t1;
    if (counts > 0) {
      return false;
    }
    return true;
  }

  ///Used to store state management to local db
  Future<Map<String, dynamic>> retrieveWorker(Tables table) async {
    final T _db = await this.database;
    final List<Map<dynamic, dynamic>> states = await _db
        .rawQuery('SELECT * FROM ${table.name} ORDER BY id DESC LIMIT 1');
    final Map<String, dynamic> _state = Map<String, dynamic>.from(states.first);

    return _state;
  }

  /// Used to retreive current state
  @override
  Future<Map<String, dynamic>> retrieveState(Tables table) async {
    final Map<String, dynamic> _state = await retrieveWorker(table);

    final dynamic state = json.decode(_state[table.name] as String);

    return state as Map<String, dynamic>;
  }

  /// [saveState] saves the current states by an [INSERT] in the database
  /// IMPORTANT: THIS METHOD WORKS ON THE ASSUMPTION THAT THE TABLE NAME
  /// MATCHES THE INSERTION FIELD NAME
  @override
  Future<void> saveState(
      {required Map<String, dynamic> data, required Tables table}) async {
    final String _tableName = table.name;

    final T _db = await this.database;
    final String _dataAsString = jsonEncode(data);
    await _db.rawInsert('INSERT INTO $_tableName($_tableName) VALUES(?)',
        <dynamic>[_dataAsString]);
    return;
  }
}
