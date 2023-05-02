import 'package:app_modulo_05/model/post_model.dart';
import 'package:app_modulo_05/repository/jsonplaceholder_custom_dio.dart';
import 'package:app_modulo_05/repository/posts/posts_repository.dart';

class PostsDioRepository implements PostsRepository {
  //

  @override
  Future<List<PostModel>> getPosts() async {
    var jsonPlaceHolderCustomDio = JsonPlaceHolderCustomDio();
    var response = await jsonPlaceHolderCustomDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List<dynamic>)
          .map((e) => PostModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
