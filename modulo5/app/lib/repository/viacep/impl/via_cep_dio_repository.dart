import 'package:app_modulo_05/model/via_cep_model.dart';
import 'package:app_modulo_05/repository/viacep/via_cep_repository.dart';
import 'package:dio/dio.dart';

class ViaCepDioRepository implements ViaCepRepository {
  @override
  @override
  Future<ViaCepModel> consultarCep(String cep) async {
    var dio = Dio();
    var response = await dio.get("https://viacep.com.br/ws/$cep/json/");
    if (response.statusCode == 200) {
      if (response.data.contains('erro')) {
        print('Contem um cep invalido!');
        return ViaCepModel(error: true);
      }
      return ViaCepModel.fromJson(response.data);
    }
    print('Ocorreu um erro na consulta.');
    return ViaCepModel(error: true);
  }
}
