import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class NewsItem {
  final String id;
  final String title;
  final String body;
  final String imageUrl;

  NewsItem({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['_id'],
      title: json['title'],
      body: json['body'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
    };
  }
}

Future<void> saveNewsToLocalDb(List<NewsItem> newsItems) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> newsJson = newsItems.map((item) => jsonEncode(item.toJson())).toList();
  await prefs.setStringList('newsItems', newsJson);
}

Future<List<NewsItem>> getNewsFromLocalDb() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? newsJson = prefs.getStringList('newsItems');
  // ignore: avoid_print
  print("FROM LOCALDB");
  if (newsJson != null) {
    return newsJson.map((item) => NewsItem.fromJson(jsonDecode(item))).toList();
  } else {
    return [];
  }
}