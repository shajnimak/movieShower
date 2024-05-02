// lib/controllers/actor_controller.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/actor.dart';

class ActorController {
  Future<List<Actor>> fetchActors() async {
    final String response = await rootBundle.loadString('./assets/json/actors.json');
    final data = json.decode(response) as Map<String, dynamic>;
    List<dynamic> actorsJson = data['actors'];
    List<Actor> actorsList = actorsJson.map((json) => Actor.fromJson(json)).toList();
    return actorsList;
  }
}
