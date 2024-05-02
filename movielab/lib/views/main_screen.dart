// lib/views/main_screen.dart
import 'package:flutter/material.dart';
import 'list_actors_screen.dart';  // Ensure you have the correct imports
import 'list_stuff_screen.dart';
import 'list_news_screen.dart';
import 'list_comments_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ListActorsScreen(),
    //StuffListPage(),
    //NewsListPage(),
    //CommentsListPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Actors'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Stuff'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Comments'),
        ],
      ),
    );
  }
}
