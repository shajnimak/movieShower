// lib/views/list_actors_screen.dart
import 'package:flutter/material.dart';
import '../controllers/news_controller.dart';
import '../models/news_item.dart';
import '../widgets/custom_list_tile_news.dart';
import 'detail_news_screen.dart';

class ListNewsScreen extends StatefulWidget {
  const ListNewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListNewsScreenState createState() => _ListNewsScreenState();
}

class _ListNewsScreenState extends State<ListNewsScreen> {
  final NewsController _actorController = NewsController();
  List<NewsItem> _newsItems = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() async {
    try {
      _newsItems = await _actorController.fetchNews();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load news: $e'; // Capturing and displaying error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('La Casa de Papel NEWS')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
            ? Center(child: Text(_errorMessage))
            : ListView.builder(
                itemCount: _newsItems.length,
                itemBuilder: (context, index) {
                  return CustomListTileNews(
                    newsItem: _newsItems[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNewsScreen(newsItem: _newsItems[index]),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
