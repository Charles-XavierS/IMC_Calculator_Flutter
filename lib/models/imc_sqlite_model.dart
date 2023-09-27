class ImcSqliteModel {
  int _id = 0;

  String _imc = '';

  ImcSqliteModel(this._id, this._imc);

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String get imc => _imc;

  set imc(String imc) {
    _imc = imc;
  }
}
