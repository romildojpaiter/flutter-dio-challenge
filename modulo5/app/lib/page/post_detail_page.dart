import 'package:app_modulo_05/model/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  //

  final PostModel postModel;
  const PostDetailPage({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: postModel.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
                Text(
                  postModel.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(
                    postModel.body,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
