import 'package:flutter/material.dart';
import 'tile_manager.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final TileManager _tileManager = TileManager();

  void _showAddTileDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Activity Name'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Activity Name"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                String activityName = _controller.text;
                if (activityName.isNotEmpty) {
                  _tileManager.addTile(activityName);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One'),
      ),
      body: _tileManager,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTileDialog(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
