class UsuarioModel {
  String? name = "";
  String email = "";
  String uid = "";

  UsuarioModel({required this.name, required this.email, required this.uid});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['uid'] = this.uid;
    return data;
  }
}
