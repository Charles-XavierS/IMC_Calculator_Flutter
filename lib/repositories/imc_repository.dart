import '../models/imc_model.dart';

class IMCRepository {
  final List<IMCResult> _imcResults = [];

  Future<void> addResult(IMCResult result) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _imcResults.add(result);
  }

  Future<void> removeResult(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _imcResults.remove(_imcResults.where((result) => result.id == id).first);
  }

  Future<List<IMCResult>> listAll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _imcResults;
  }
}
