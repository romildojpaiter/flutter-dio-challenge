class TarefasModel {
  List<TarefaModel> tarefas = [];

  TarefasModel(this.tarefas);

  TarefasModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaModel>[];
      json['results'].forEach((v) {
        tarefas.add(new TarefaModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tarefas != null) {
      data['results'] = this.tarefas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TarefaModel {
  String objectId = "";
  String createdAt = "";
  String updatedAt = "";
  String descricao = "";
  bool concluida = false;

  TarefaModel(this.objectId, this.createdAt, this.updatedAt, this.descricao,
      this.concluida);

  TarefaModel.criar(this.descricao, this.concluida);

  TarefaModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    descricao = json['descricao'];
    concluida = json['concluida'];
  }

  Map<String, dynamic> toJson() => {
        'objectId': this.objectId,
        'createdAt': this.createdAt,
        'updatedAt': this.updatedAt,
        'descricao': this.descricao,
        'concluida': this.concluida
      };

  Map<String, dynamic> createWithJson() => {
        "descricao": "${this.descricao}",
        "concluida": this.concluida,
      };
}
