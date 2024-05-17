import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class EventController {
  final String apiUrl = 'http://10.0.2.2:3000/events';

  Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
