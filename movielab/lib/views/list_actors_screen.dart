// lib/views/list_actors_screen.dart
import 'package:flutter/material.dart';
import '../controllers/actor_controller.dart';
import '../models/actor.dart';
import '../widgets/custom_actor_list_tile.dart';
import 'detail_actor_screen.dart';

class ListActorsScreen extends StatefulWidget {
  const ListActorsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListActorsScreenState createState() => _ListActorsScreenState();
}

class _ListActorsScreenState extends State<ListActorsScreen> {
  final ActorController _actorController = ActorController();
  List<Actor> _actors = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchActors();
  }

  void _fetchActors() async {
    try {
      _actors = await _actorController.fetchActors();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage =
            'Failed to load actors: $e'; // Capturing and displaying error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Cast')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : ListView.builder(
                  itemCount: _actors.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      actor: _actors[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailActorScreen(actor: _actors[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
