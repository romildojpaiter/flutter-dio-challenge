import 'package:app_modulo_05/model/comment_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> getCommentsById(int postId);
}
