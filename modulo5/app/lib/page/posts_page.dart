import 'package:app_modulo_05/model/post_model.dart';
import 'package:app_modulo_05/page/comment_page.dart';
import 'package:app_modulo_05/repository/posts/impl/posts_dio_repository.dart';
import 'package:app_modulo_05/repository/posts/impl/posts_http_repository.dart';
import 'package:app_modulo_05/repository/posts/posts_repository.dart';

import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  //

  PostsRepository postsRepository = PostsDioRepository();
  // List<PostModel> postModels = [];
  var postModels = <PostModel>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      loading = true;
    });
    postModels = await postsRepository.getPosts();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: postModels.length,
              itemBuilder: (BuildContext bc, int index) {
                var post = postModels[index];
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentPage(postId: post.id),
                    ),
                  ),
                  child: Hero(
                    tag: postModels[index].id,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                post.body,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Ler mais",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
