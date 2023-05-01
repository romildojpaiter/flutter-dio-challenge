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
    super.initState();
    recoveryComments();
    setState(() {
      loading = false;
    });
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
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (_, int index) {
                    var comment = comments[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Text(comment.body),
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
  }
}
