import 'package:app_modulo_05/model/comment_model.dart';
import 'package:app_modulo_05/repository/comments_repository.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  final int postId;
  const CommentPage({super.key, required this.postId});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  //

  var commentsRespository = CommentsRepository();
  var comments = <CommentModel>[];
  bool loading = false;

  @override
  void initState() {
    setState(() {
      loading = true;
    });
    super.initState();
    recoveryComments();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text("Comentário: "),
              Text(
                "${widget.postId}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (_, int index) {
                    var comment = comments[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.0),
                      child: Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Comentário",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                comment.body,
                                style: TextStyle(),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                children: [
                                  const Text("By: "),
                                  Text(
                                    comment.name.length >= 16
                                        ? comment.name.substring(0, 16)
                                        : comment.name.substring(0, 14),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Text(comment.email.toLowerCase()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  void recoveryComments() async {
    setState(() {
      loading = true;
    });
    comments = await commentsRespository.getCommentsById(widget.postId);
    print(comments);
    setState(() {
      loading = false;
    });
  }
}
