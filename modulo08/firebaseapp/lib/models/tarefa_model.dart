class TarefaModel {
  String descricao = "";
  bool concluido = false;
  DateTime? concludedAt;

  TarefaModel(
      {required this.descricao, required this.concluido, this.concludedAt});

  TarefaModel.of({required this.descricao, required this.concluido});

  TarefaModel.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    concluido = json['concluido'];
    concludedAt = json['concludedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['concluido'] = this.concluido;
    data['concludedAt'] = this.concludedAt;
    return data;
  }
}
