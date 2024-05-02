// lib/models/actor.dart
class Actor {
  final int id;
  final String name;
  final String characterName;
  final String bio;
  final String imageUrl;

  Actor({
    required this.id,
    required this.name,
    required this.characterName,
    required this.bio,
    required this.imageUrl
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      name: json['name'],
      characterName: json['characterName'],
      bio: json['bio'],
      imageUrl: json['imageUrl']
    );
  }
}
