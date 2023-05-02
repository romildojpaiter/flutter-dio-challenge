import 'package:app_modulo_05/model/comment_model.dart';
import 'package:app_modulo_05/repository/comments/comments_repository.dart';
import 'package:app_modulo_05/repository/jsonplaceholder_custom_dio.dart';

class CommentsDioRepository implements CommentsRepository {
  //

  @override
  Future<List<CommentModel>> getCommentsById(int postId) async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response =
        await jsonPlaceHolderCustomDio.dio.get("/posts/$postId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
