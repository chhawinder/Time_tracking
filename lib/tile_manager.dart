import 'package:flutter/material.dart';
import 'timer_widget.dart';

class TileManager extends StatefulWidget {
  final _TileManagerState _tileManagerState = _TileManagerState();

  @override
  _TileManagerState createState() => _tileManagerState;

  void addTile(String tileName) {
    _tileManagerState.addTile(tileName);
  }
}

class _TileManagerState extends State<TileManager> {
  List<TileData> _tiles = [];
  bool _isAnyTileActive = false;
  String _activeTileName = '';

  void addTile(String tileName) {
    setState(() {
      _tiles.add(TileData(name: tileName));
    });
  }

  void _checkActiveTiles() {
    setState(() {
      _isAnyTileActive = _tiles.any((tile) => tile.isActive);
      if (_isAnyTileActive) {
        _activeTileName = _tiles.firstWhere((tile) => tile.isActive).name;
      } else {
        _activeTileName = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimerWidget(
            isActive: _isAnyTileActive, activeTileName: _activeTileName),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: _tiles.length,
            itemBuilder: (context, index) {
              return TileItem(
                tile: _tiles[index],
                onToggle: _checkActiveTiles,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TileData {
  String name;
  bool isActive;

  TileData({required this.name, this.isActive = false});
}

class TileItem extends StatefulWidget {
  final TileData tile;
  final VoidCallback onToggle;

  TileItem({required this.tile, required this.onToggle});

  @override
  _TileItemState createState() => _TileItemState();
}

class _TileItemState extends State<TileItem> {
  void _toggleActive() {
    setState(() {
      widget.tile.isActive = !widget.tile.isActive;
    });
    widget.onToggle();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.tile.name),
          Switch(
            value: widget.tile.isActive,
            onChanged: (value) {
              _toggleActive();
            },
          ),
        ],
      ),
    );
  }
}
