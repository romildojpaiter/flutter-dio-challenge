import 'package:app_modulo_05/model/comment_model.dart';
import 'package:app_modulo_05/repository/comments/comments_repository.dart';
import 'package:dio/dio.dart';

class CommentsDioRepository implements CommentsRepository {
  //

  @override
  Future<List<CommentModel>> getCommentsById(int postId) async {
    var dio = Dio();
    var response = await dio
        .get("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
