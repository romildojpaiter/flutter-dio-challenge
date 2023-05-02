import 'package:app_modulo_05/model/via_cep_model.dart';

abstract class ViaCepRepository {
  Future<ViaCepModel> consultarCep(String cep);
}
