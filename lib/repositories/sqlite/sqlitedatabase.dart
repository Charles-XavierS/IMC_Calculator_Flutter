import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: ''' CREATE TABLE listImc (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    imc TEXT
  );'''
};

class SQLiteDataBase {
  static Database? db;

  Future<Database> getDataBase() async {
    if (db == null) {
      try {
        db = await initDataBase();
      } catch (e) {
        print('Erro ao inicializar o banco de dados: $e');
      }
    }

    if (db == null) {
      throw Exception('Banco de dados não inicializado corretamente.');
    }

    return db!;
  }

  Future<Database> initDataBase() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }
}
