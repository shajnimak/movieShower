// lib/models/stuff.dart
class Stuff {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Stuff(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl});

  factory Stuff.fromJson(Map<String, dynamic> json) {
    return Stuff(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl']);
  }
}
