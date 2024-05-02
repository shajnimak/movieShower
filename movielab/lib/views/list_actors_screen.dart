// lib/views/list_actors_screen.dart
import 'package:flutter/material.dart';
import '../controllers/actor_controller.dart';
import '../models/actor.dart';

class ListActorsScreen extends StatefulWidget {
  @override
  _ListActorsScreenState createState() => _ListActorsScreenState();
}

class _ListActorsScreenState extends State<ListActorsScreen> {
  final ActorController _actorController = ActorController();
  List<Actor> _actors = [];

  @override
  void initState() {
    super.initState();
    _fetchActors();
  }

  _fetchActors() async {
    try {
      _actors = await _actorController.fetchActors();
      print("Actors fetched: ${_actors.length}"); // Check how many actors are fetched
      setState(() {});
    } catch (e) {
      print('Failed to load actors: $e'); // This will print if there is an error
    }
  }


  @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('La Casa de Papel Actors')),
        body: _actors.isEmpty
            ? Center(child: CircularProgressIndicator()) // Shows a loading spinner if actors list is empty
            : ListView.builder(
                itemCount: _actors.length,
                itemBuilder: (context, index) {
                Actor actor = _actors[index];
                return ListTile(
                    title: Text(actor.name),
                    subtitle: Text(actor.characterName),
                    onTap: () {
                    // Action on tap (if needed)
                    },
                );
                },
            ),
        );
    }
}
