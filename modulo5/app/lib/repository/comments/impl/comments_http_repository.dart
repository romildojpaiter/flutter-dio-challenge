import 'dart:convert';

import 'package:app_modulo_05/model/comment_model.dart';
import 'package:app_modulo_05/repository/comments/comments_repository.dart';
import 'package:http/http.dart' as http;

class CommentsHttpRepository implements CommentsRepository {
  //

  @override
  Future<List<CommentModel>> getCommentsById(int postId) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200) {
      var jsonBody = json.decode(response.body);
      return (jsonBody as List).map((e) => CommentModel.fromJson(e)).toList();
    }
    return [];
  }
}
