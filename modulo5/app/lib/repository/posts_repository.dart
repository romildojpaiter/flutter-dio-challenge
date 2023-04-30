import 'dart:convert';

import 'package:app_modulo_05/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostsRespository {
  Future<List<PostModel>> getPosts() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var jsonsPost = json.decode(response.body);
      return (jsonsPost as List).map((e) => PostModel.fromJson(e)).toList();
    }
    return [];
  }
}
