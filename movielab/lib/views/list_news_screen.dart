
import 'package:flutter/material.dart';
import '../../views/main_screen.dart';
import '../../controllers/news_controller.dart';
import '../../models/news_item.dart';
import '../../widgets/custom_news_list_tile.dart';
import 'detail_news_screen.dart';


class ListNewsScreen extends StatefulWidget {
  const ListNewsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListNewsScreenState createState() => _ListNewsScreenState();
}

class _ListNewsScreenState extends State<ListNewsScreen> {
  final NewsController _newsController = NewsController();
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
      _newsItems = await _newsController.fetchNews();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage =
            'Failed to load news: $e'; // Capturing and displaying error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(
                  context); // Just go back to the previous screen if possible
            } else {
              // If no previous screen, replace with the main screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            }
          },
        ),
      ),
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
                            builder: (context) =>
                                DetailNewsScreen(newsItem: _newsItems[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
