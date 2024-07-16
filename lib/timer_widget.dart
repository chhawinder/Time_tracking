import 'package:flutter/material.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  final bool isActive;
  final String activeTileName;

  TimerWidget({required this.isActive, required this.activeTileName});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    if (widget.isActive) {
      _startTimer();
    }
  }

  @override
  void didUpdateWidget(covariant TimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _startTimer();
      } else {
        _stopTimer();
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Active Tile: ${widget.activeTileName}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Timer: $_seconds seconds',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          )
        : Container();
  }
}
