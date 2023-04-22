import 'package:challenge04/model/configuracoes_model.dart';
import 'package:hive/hive.dart';

class ConfiguracoesRepository {
  static const String _CONFIGURACOES = 'configuracoes';

  static late Box box;

  ConfiguracoesRepository._carregar();

  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen(_CONFIGURACOES)) {
      box = Hive.box(_CONFIGURACOES);
    } else {
      box = await Hive.openBox(_CONFIGURACOES);
    }
    return ConfiguracoesRepository._carregar();
  }

  void salvar(ConfiguracoesModel configuracoesModel) {
    box.put('key', configuracoesModel.toJson());
  }

  ConfiguracoesModel obter() {
    var configuracoes = box.get(_CONFIGURACOES);
    if (configuracoes == null) {
      return ConfiguracoesModel.vazio();
    }
    return ConfiguracoesModel(
      configuracoes["_nomeUsuario"],
      configuracoes["_altura"],
      configuracoes["_receberNotificacoes"],
      configuracoes["_temaEscuro"],
    );
  }
}
