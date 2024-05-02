// lib/views/list_actors_screen.dart
import 'package:flutter/material.dart';
import '../controllers/comment_controller.dart';
import '../models/comment.dart';
import '../widgets/custom_comment_list_tile.dart';

class ListCommentScreen extends StatefulWidget {
  const ListCommentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListCommentScreenState createState() => _ListCommentScreenState();
}

class _ListCommentScreenState extends State<ListCommentScreen> {
  final CommentController _commentController = CommentController();
  List<Comment> _comments = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchActors();
  }

  void _fetchActors() async {
    try {
      _comments = await _commentController.fetchcomment();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load comments: $e'; // Capturing and displaying error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
            ? Center(child: Text(_errorMessage))
            : ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return CustomCommentTile(
                    comment: _comments[index]
                  );
                },
              ),
    );
  }
}
