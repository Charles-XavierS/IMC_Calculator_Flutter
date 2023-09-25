import 'package:flutter/material.dart';

class IMCResult {
  final String _id = UniqueKey().toString();
  final String _imc;

  IMCResult(this._imc);

  String get id => _id;

  String getImc() {
    return _imc;
  }
}
