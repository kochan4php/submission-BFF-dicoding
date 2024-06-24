import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDatabase {
  Database? _database;
  final String tableName;

  BaseDatabase({required this.tableName});

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'resto_rasa.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  Future _onCreate(Database db, int version) async {
    String sqlCreate = '''
      CREATE TABLE $tableName (
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        pictureId TEXT,
        city TEXT,
        rating REAL
      );
    ''';

    await db.execute(sqlCreate);
  }

  Future deleteTable() async {
    final db = await database;
    await db!.execute('DROP TABLE IF EXISTS $tableName');
  }
}
