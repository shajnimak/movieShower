import 'package:flutter/material.dart';
import '../models/comment.dart';

class CustomCommentTile extends StatelessWidget {
  final Comment comment;

  const CustomCommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment.text),
      subtitle: Text('Author: ${comment.author}'),
      leading: CircleAvatar(
        child: Text(comment.author[0])
      ),
    );
  }
}
