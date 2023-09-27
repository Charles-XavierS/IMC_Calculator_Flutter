import 'package:imc_flutter/models/imc_sqlite_model.dart';
import 'package:imc_flutter/repositories/sqlite/sqlitedatabase.dart';

class IMCSqliteRepository {
  Future<List<ImcSqliteModel>> getDataBase() async {
    List<ImcSqliteModel> listImc = [];
    var db = await SQLiteDataBase().getDataBase();
    var results = await db.rawQuery('SELECT id, imc FROM listImc');
    for (var element in results) {
      listImc.add(ImcSqliteModel(
          int.parse(element["id"].toString()), element["imc"].toString()));
    }
    return listImc;
  }

  Future<void> save(ImcSqliteModel imcSqliteModel) async {
    var db = await SQLiteDataBase().getDataBase();
    await db
        .rawInsert('INSERT INTO listImc (imc) values(?)', [imcSqliteModel.imc]);
  }

  Future<void> delete(int id) async {
    var db = await SQLiteDataBase().getDataBase();
    await db.rawDelete('DELETE FROM listImc WHERE id = ?', [id]);
  }
}
