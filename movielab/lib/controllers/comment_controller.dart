// lib/controllers/comment_controller.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/comment.dart';

class CommentController {
  Future<List<Comment>> fetchcomment() async {
    final String response = await rootBundle.loadString('./assets/json/comment.json');
    final data = json.decode(response) as Map<String, dynamic>;
    List<dynamic> actorsJson = data['comment'];
    List<Comment> commentList = actorsJson.map((json) => Comment.fromJson(json)).toList();
    return commentList;
  }
}
