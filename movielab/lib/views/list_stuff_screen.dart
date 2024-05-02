// lib/views/list_stuff_screen.dart
import 'package:flutter/material.dart';
import '../controllers/stuff_controller.dart';
import '../models/stuff.dart';
import '../widgets/custom_stuff_list_tile.dart'; // Custom ListTile for stuff items

class ListStuffScreen extends StatefulWidget {
  const ListStuffScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListStuffScreenState createState() => _ListStuffScreenState();
}

class _ListStuffScreenState extends State<ListStuffScreen> {
  final StuffController _stuffController = StuffController();
  List<Stuff> _stuff = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchStuff();
  }

  void _fetchStuff() async {
    try {
      _stuff = await _stuffController.fetchStuff();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load stuff: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Stuff')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : ListView.builder(
                  itemCount: _stuff.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      title: _stuff[index].name,
                      subtitle: _stuff[index].description,
                      imageUrl: _stuff[index].imageUrl,
                      onTap: () {
                        // Implement navigation to detail screen if necessary
                      },
                    );
                  },
                ),
    );
  }
}
