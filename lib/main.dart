import 'package:flutter/material.dart';
import 'package:themepark/fun_screen.dart';
import 'package:themepark/map_screen.dart';
import 'package:themepark/waiting_times_screen.dart';
import 'package:themepark/rides_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robert\'s Rodeo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor:
            Colors.blue[900], // Set the background color of Material components
      ),
      home: MainScreen(), // Set MainScreen as the home screen
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    RidesScreen(),
    MapScreen(),
    WaitingTimesScreen(),
    FunScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Robert\'s Rodeo'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue[900], // Dark blue background color
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors
            .blue[900], // Set the background color of the bottom navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Rides',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Waiting Times',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Fun',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
