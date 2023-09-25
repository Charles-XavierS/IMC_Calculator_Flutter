import 'package:flutter/material.dart';

import '../models/imc_model.dart';

class IMCResultsProvider with ChangeNotifier {
  final List<IMCResult> _imcResults = [];

  List<IMCResult> get imcResults => _imcResults;

  void addResult(IMCResult result) {
    _imcResults.add(result);
    notifyListeners(); // Notifica os ouvintes sobre a alteração na lista
  }

  void removeResult(String id) {
    _imcResults.removeWhere((result) => result.id == id);
    notifyListeners();
  }
}
