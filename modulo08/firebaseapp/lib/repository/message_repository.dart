import 'package:firebaseapp/models/mensagem_model.dart';

abstract class MensagemRepository {
  void add(MensagemModel mensagemModel);
}
