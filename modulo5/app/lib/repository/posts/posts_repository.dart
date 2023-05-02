import 'package:app_modulo_05/model/post_model.dart';

abstract class PostsRepository {
  //

  Future<List<PostModel>> getPosts();
}
