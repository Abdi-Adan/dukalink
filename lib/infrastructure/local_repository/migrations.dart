
import 'package:dukalink/infrastructure/local_repository/database_base.dart';

final List<String> migrations = <String>[
  '''
  CREATE TABLE IF NOT EXISTS ${Tables.userState.name} (id INTEGER PRIMARY KEY,
          userState TEXT)''',
];
