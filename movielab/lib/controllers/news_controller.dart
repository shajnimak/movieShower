// lib/controllers/news_contriller.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/news_item.dart';

class NewsController {
  Future<List<NewsItem>> fetchNews() async {
    final String response = await rootBundle.loadString('./assets/json/news.json');
    final data = json.decode(response) as Map<String, dynamic>;
    List<dynamic> actorsJson = data['news'];
    List<NewsItem> newsList = actorsJson.map((json) => NewsItem.fromJson(json)).toList();
    return newsList;
  }
}
