import 'package:flutter/material.dart';
import '../controllers/event_controller.dart';
import '../models/event.dart';

class ListEventsScreen extends StatefulWidget {
  const ListEventsScreen({super.key});

  @override
  _ListEventsScreenState createState() => _ListEventsScreenState();
}

class _ListEventsScreenState extends State<ListEventsScreen> {
  final EventController _eventController = EventController();
  List<Event> _events = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  void _fetchEvents() async {
    try {
      _events = await _eventController.fetchEvents();
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load events: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : ListView.builder(
                  itemCount: _events.length,
                  itemBuilder: (context, index) {
                    final event = _events[index];
                    return ListTile(
                      title: Text(event.title),
                      subtitle: Text(event.description),
                      trailing: Text(event.date.toLocal().toString()),
                    );
                  },
                ),
    );
  }
}
