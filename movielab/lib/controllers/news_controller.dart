// lib/controllers/news_contriller.dart
import '../models/news_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsController {
  Future<List<NewsItem>> fetchNews() async {
    List<NewsItem> newsItems = await getNewsFromLocalDb();

  if (newsItems.isEmpty) {
    newsItems = await fetchNewsFromBackend();
    await saveNewsToLocalDb(newsItems);
    // ignore: avoid_print
    print("ITEMS WAS UPLOAD");
  }

  return newsItems;
    // final String response = await rootBundle.loadString('./assets/json/news.json');
    // final data = json.decode(response) as Map<String, dynamic>;
    // List<dynamic> actorsJson = data['news'];
    // List<NewsItem> newsList = actorsJson.map((json) => NewsItem.fromJson(json)).toList();
    // return newsList;
  }

  Future<List<NewsItem>> fetchNewsFromBackend() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/news'));

    if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => NewsItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

}
