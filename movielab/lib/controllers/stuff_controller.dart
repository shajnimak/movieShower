// lib/controller/stuff_controller.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/stuff.dart';

class StuffController {
  Future<List<Stuff>> fetchStuff() async {
    final String response =
        await rootBundle.loadString('assets/json/stuff.json');
    final Map<String, dynamic> data = json.decode(response);
    final List<dynamic> stuffList =
        data['stuff']; // Correctly access the 'stuff' key
    return stuffList.map((json) => Stuff.fromJson(json)).toList();
  }
}
