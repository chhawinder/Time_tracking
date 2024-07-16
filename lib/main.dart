import 'package:flutter/material.dart';
import 'screen_one.dart';
import 'screen_two.dart';
import 'bottom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/screen_one': (context) =>
            ScreenWrapper(screen: ScreenOne(), selectedIndex: 0),
        '/screen_two': (context) =>
            ScreenWrapper(screen: ScreenTwo(), selectedIndex: 1),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<String> _routes = ['/screen_one', '/screen_two'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class ScreenWrapper extends StatelessWidget {
  final Widget screen;
  final int selectedIndex;

  ScreenWrapper({required this.screen, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          final routes = ['/screen_one', '/screen_two'];
          Navigator.pushReplacementNamed(context, routes[index]);
        },
      ),
    );
  }
}
