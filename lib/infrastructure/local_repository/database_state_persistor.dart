import 'package:async_redux/async_redux.dart';
import 'package:dukalink/application/redux/states/app_state.dart';
import 'package:dukalink/application/redux/states/user_state.dart';
import 'package:dukalink/infrastructure/local_repository/database_base.dart';
import 'package:dukalink/infrastructure/local_repository/database_mobile.dart';
import 'package:dukalink/infrastructure/local_repository/initialize_db.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

/// [DukalinkStateDatabase] is the middleware that interacts with the database on behalf
/// of the application. From the apps perspective, it doesn't care which database
/// its saving its state on.
class DukalinkStateDatabase implements PersistorPrinterDecorator<AppState> {
  DukalinkStateDatabase({
    Duration throttle = const Duration(seconds: 2),
    Duration saveDuration = Duration.zero,
    required this.dataBaseName,
  })  : _throttle = throttle,
        _saveDuration = saveDuration;

  final Duration? _saveDuration;
  final Duration? _throttle;
  final String dataBaseName;

  @override
  Duration? get throttle => _throttle;

  Duration? get saveDuration => _saveDuration;

  @override
  Future<void> deleteState() async {
    await DukalinkDatabaseMobile<Database>(
            initializeDB: InitializeDB<Database>(dbName: dataBaseName))
        .clearDatabase();
  }

  @override
  Future<void> persistDifference({
    AppState? lastPersistedState,
    required AppState newState,
  }) async {
    await Future<dynamic>.delayed(saveDuration!);

    if (lastPersistedState == null ||
        lastPersistedState.userState != newState.userState) {
      await persistState(
        newState,
        DukalinkDatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: dataBaseName),
        ),
      );
    }
  }

  /// we first check whether the database is empty
  ///
  /// - if the database is empty, we return null
  /// - else, we retrieve the state from the database
  @override
  Future<AppState> readState() async {
    if (await DukalinkDatabaseMobile<Database>(
            initializeDB: InitializeDB<Database>(dbName: dataBaseName))
        .isDatabaseEmpty()) {
      return AppState.initial();
    } else {
      return retrieveState(
        DukalinkDatabaseMobile<Database>(
            initializeDB: InitializeDB<Database>(dbName: dataBaseName)),
      );
    }
  }

  @override
  Future<void> saveInitialState(AppState state) async {
    return persistDifference(newState: state);
  }

  /// initialize the database
  Future<void> init() async {
    await DukalinkDatabaseMobile(
            initializeDB: InitializeDB(dbName: dataBaseName))
        .database;
  }

  @visibleForTesting
  Future<void> persistState(
      AppState newState, DukalinkDatabaseBase<dynamic> database) async {
    // save KYC state
    await database.saveState(
        data: newState.userState!.toJson(), table: Tables.userState);
  }

  @visibleForTesting
  Future<AppState> retrieveState(DukalinkDatabaseBase<dynamic> database) async {
    return const AppState().copyWith(
      // retrieve Onboarding State
      userState:
          UserState.fromJson(await database.retrieveState(Tables.userState)),

      wait: Wait(),
    );
  }
}
