import 'package:challenge04/model/dados_cadastrais_model.dart';
import 'package:hive/hive.dart';

class DadosCadastraisRepository {
  static const String _KEY_DADOS_CADASTRAIS = 'dados_cadastrais';

  static late Box box;

  DadosCadastraisRepository._carregar();

  static Future<DadosCadastraisRepository> carregar() async {
    if (Hive.isBoxOpen(_KEY_DADOS_CADASTRAIS)) {
      box = Hive.box(_KEY_DADOS_CADASTRAIS);
    } else {
      box = await Hive.openBox(_KEY_DADOS_CADASTRAIS);
    }
    return DadosCadastraisRepository._carregar();
  }

  void salvar(DadosCadastraisModel dadosCadastraisModel) {
    box.put(_KEY_DADOS_CADASTRAIS, dadosCadastraisModel);
  }

  DadosCadastraisModel obter() {
    var dados = box.get(_KEY_DADOS_CADASTRAIS);
    if (dados == null) {
      return DadosCadastraisModel.vazio();
    }
    return dados;
  }
}
