// lib/models/actor.dart
class Comment{
  final int id;
  final String text;
  final String author;

  Comment({
    required this.id,
    required this.text,
    required this.author,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      text: json['text'],
      author: json['author']
    );
  }
}
