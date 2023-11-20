import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        'bettwe-workout.mobile.db',
      ),
      version: 01,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_createChallengerTable);
  }

  String get _createChallengerTable => '''
    CREATE TABLE challengers (
      created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      updated_at  DATETIME,
      email TEXT UNIQUE,
      auth_token TEXT,
      name TEXT,
    );
  ''';
}
