// lib/views/main_screen.dart
import 'package:flutter/material.dart';
import 'list_actors_screen.dart';  // Ensure you have the correct imports
import 'list_stuff_screen.dart';
import 'list_news_screen.dart';
import 'list_comments_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brochure for the series'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/mainPoster.jpg'), // Path to your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '',
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
                const SizedBox(height: 250.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the list of stuff screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListStuffScreen()),
                    );
                  },
                  child: const Text('List of Stuff'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the list of actors screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListActorsScreen()),
                    );
                  },
                  child: const Text('List of Actors'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the list of news screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListNewsScreen()),
                    );
                  },
                  child: const Text('List of News'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the list of news screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListCommentScreen()),
                    );
                  },
                  child: const Text('Comments'),
                )
                // Add more buttons for other screens if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
