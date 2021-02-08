import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbSQLite {
  Database _intance;
  final versionDb = 1;

  static final _db = DbSQLite.internal();

  DbSQLite.internal();

  factory DbSQLite() {
    return _db;
  }

  Future<Database> getInstance() async {
    if (_intance == null) _intance = await _openDatabase();

    return _intance;
  }

  Future<Database> _openDatabase() async {
    var pathDb = await getDatabasesPath();
    var sqlite = await openDatabase(
      join(pathDb, 'cars.db'),
      version: versionDb,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE cars (
            car_id INTEGER PRIMARY KEY AUTOINCREMENT,
            model TEXT,
            brand TEXT,
            year INTEGER,
            price INTEGER,
            photo TEXT
          )
        ''');
        print('executou');
      },
    );

    return sqlite;
  }
}
