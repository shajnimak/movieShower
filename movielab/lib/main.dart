// lib/main.dart
import 'package:flutter/material.dart';
import 'views/main_screen.dart';  // Correct path to the main_screen.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Casa de Papel App',
      theme: ThemeData(
        primarySwatch: Colors.red,  // Theme color to match the show's theme
      ),
      home: const MainScreen(),  // MainScreen is now correctly referenced
    );
  }
}
/*
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Flutter App!',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the list of stuff screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StuffListPage()),
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
                  MaterialPageRoute(builder: (context) => const ActorListPage()),
                );
              },
              child: const Text('List of Actors'),
            ),
            // Add more buttons for other screens if needed
          ],
        ),
      ),
    );
  }
}

class StuffListPage extends StatelessWidget {
  const StuffListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Stuff'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace 10 with your actual number of stuff items
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Stuff Item $index'),
            onTap: () {
              // Navigate to the detail screen of the selected stuff item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StuffDetailPage(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StuffDetailPage extends StatelessWidget {
  final int index;

  const StuffDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stuff Detail'),
      ),
      body: Center(
        child: Text('Detail of Stuff Item $index'),
      ),
    );
  }
}

class ActorListPage extends StatelessWidget {
  const ActorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Actors'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace 10 with your actual number of actors
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Actor $index'),
            onTap: () {
              // Navigate to the detail screen of the selected actor
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActorDetailPage(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ActorDetailPage extends StatelessWidget {
  final int index;

  const ActorDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actor Detail'),
      ),
      body: Center(
        child: Text('Detail of Actor $index'),
      ),
    );
  }
}

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of News'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace 10 with your actual number of news articles
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('News Article $index'),
            onTap: () {
              // Navigate to the detail screen of the selected news article
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final int index;

  const NewsDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Center(
        child: Text('Detail of News Article $index'),
      ),
    );
  }
}

class CommentsListPage extends StatelessWidget {
  const CommentsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Comments'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace 10 with your actual number of comments
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Comment $index'),
            subtitle: const Text('This is a comment on something.'),
            onTap: () {
              // You can implement the logic for viewing individual comments here
              // For simplicity, we'll navigate to a dummy comment detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommentDetailPage(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CommentDetailPage extends StatelessWidget {
  final int index;

  const CommentDetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comment Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Detail of Comment $index',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
