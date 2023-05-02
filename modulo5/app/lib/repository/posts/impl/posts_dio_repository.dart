import 'dart:convert';

import 'package:app_modulo_05/model/post_model.dart';
import 'package:app_modulo_05/repository/posts/posts_repository.dart';
import 'package:dio/dio.dart';

class PostsDioRespository implements PostsRepository {
  //

  @override
  Future<List<PostModel>> getPosts() async {
    var dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      var jsonPosts = json.decode(response.data);
      return (jsonPosts as List).map((e) => PostModel.fromJson(e)).toList();
    }
    return [];
  }
}
