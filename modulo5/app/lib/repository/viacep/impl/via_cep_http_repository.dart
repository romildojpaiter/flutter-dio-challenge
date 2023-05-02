import 'dart:convert';

import 'package:app_modulo_05/repository/viacep/via_cep_repository.dart';
import 'package:http/http.dart' as http;
import 'package:app_modulo_05/model/via_cep_model.dart';

class ViaCepHttpRepository implements ViaCepRepository {
  //

  @override
  Future<ViaCepModel> consultarCep(String cep) async {
    var url = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if (response.body.contains('erro')) {
        print('Contem um cep invalido!');
        return ViaCepModel(error: true);
      }
      var body = json.decode(response.body);
      return ViaCepModel.fromJson(body);
    }
    print('Ocorreu um erro na consulta.');
    return ViaCepModel(error: true);
  }
}
