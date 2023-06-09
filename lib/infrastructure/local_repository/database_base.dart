/// [DukalinkDatabaseBase] (Local SQLite Database)defines an interface to be fulfilled so that a storage component
/// may work, for each exclusive platform.
abstract class DukalinkDatabaseBase<T> {
  /// get the [database] instance
  Future<T> get database;

  /// [saveState] stores the state in the linked [database]
  Future<void> saveState(
      {required Map<String, dynamic> data, required Tables table});

  /// [countTableRecords] get how many records belong to specific table as in the
  /// case of SQLite, and key as in the case of local storage
  Future<int> countTableRecords(Tables table);

  /// [retrieveState] fetches the state from storage unit
  Future<Map<String, dynamic>> retrieveState(Tables table);

  Future<bool> isDatabaseEmpty();

  /// [clearDatabase] flushes or deletes the database.
  Future<void> clearDatabase();
}

/// [Tables] definitions
enum Tables { userState }

/// [TablesEx] extends [Tables] enum to get the values as
/// strings
extension TablesEx on Tables {
  String get name {
    switch (this) {
      case Tables.userState:
        return 'userState';
    }
  }
}
