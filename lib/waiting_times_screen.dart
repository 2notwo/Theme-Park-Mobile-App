import 'dart:math';
import 'package:flutter/material.dart';
import 'package:themepark/rides_screen.dart';

class WaitingTimesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Current Waiting Times',
          style: TextStyle(color: Colors.white), // Text color: white
        ),
        backgroundColor: Colors.blue, // App bar color: blue
      ),
      body: Container(
        color: Colors.blue[100], // Light blue background color
        child: _buildWaitingTimesList(), // Build the list of waiting times
      ),
    );
  }
}

Widget _buildWaitingTimesList() {
  return ListView.builder(
    itemCount: rides.length, // Use the list of rides data
    itemBuilder: (BuildContext context, int index) {
      final ride = rides[index];
      final waitingTime =
          _generateRandomWaitingTime(); // Generate random waiting time
      return Card(
        color: Colors.white, // Card color: white
        child: ListTile(
          title: Text(ride.name,
              style: TextStyle(
                  color: Colors.black)), // Ride name text color: black
          subtitle: Text('$waitingTime minutes',
              style: TextStyle(
                  color: Colors.black)), // Waiting time text color: black
        ),
      );
    },
  );
}

// Function to generate random waiting time (for demonstration)
int _generateRandomWaitingTime() {
  final random = Random();
  return random.nextInt(60) +
      10; // Random waiting time between 10 to 69 minutes
}
