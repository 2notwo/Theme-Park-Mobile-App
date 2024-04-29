import 'package:flutter/material.dart';

class RidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rides and Themed Gardens',
          style: TextStyle(
            color: Colors.white, // Change text color to white
            fontSize: 20.0, // Increase font size
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
        backgroundColor:
            Colors.blue[900], // Dark blue background color for app bar
      ),
      body: _buildRidesList(), // Implement this function to build the list
      backgroundColor: Colors.blue[800], // Dark blue background color for body
    );
  }
}

class Ride {
  final String name;
  final String description;
  final int minimumHeightInCentimeters;
  final String imagePath; // Image asset path

  Ride({
    required this.name,
    required this.description,
    required this.minimumHeightInCentimeters,
    required this.imagePath,
  });
}

Widget _buildRidesList() {
  return ListView.builder(
    itemCount: rides.length,
    itemBuilder: (BuildContext context, int index) {
      final ride = rides[index];
      return RideCard(
        ride: ride,
      );
    },
  );
}

class RideCard extends StatefulWidget {
  final Ride ride;

  const RideCard({Key? key, required this.ride}) : super(key: key);

  @override
  _RideCardState createState() => _RideCardState();
}

class _RideCardState extends State<RideCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[700], // Dark blue background color for each card
      margin: EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 16.0), // Add margin around each card
      elevation: 4.0, // Add elevation for a shadow effect
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Add rounded corners to the card
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(
                widget.ride.name,
                style: TextStyle(
                  color: Colors.white, // Change text color to white
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
              subtitle: Text(
                widget.ride.description,
                style: TextStyle(
                  color: Colors.white70, // Lighter text color
                ),
              ),
            ),
            if (_expanded)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      widget.ride.imagePath,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Minimum Height: ${widget.ride.minimumHeightInCentimeters} cm',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

List<Ride> rides = [
  Ride(
    name: 'Roller Coaster',
    description: 'Experience thrilling loops and drops!',
    minimumHeightInCentimeters:
        130, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/rollercoaster.webp',
  ),
  Ride(
    name: 'Botanical Garden',
    description: 'Explore a variety of exotic plants and flowers.',
    minimumHeightInCentimeters:
        125, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/botanical.jpg',
  ),
  Ride(
    name: 'Ferris Wheel',
    description: 'Enjoy panoramic views of the theme park!',
    minimumHeightInCentimeters:
        120, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/ferris.jpg',
  ),
  Ride(
    name: 'Water Rapids',
    description: 'Splash through wild water currents!',
    minimumHeightInCentimeters:
        135, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/rapids.jpg',
  ),
  Ride(
    name: 'Carousel',
    description: 'Classic fun for all ages!',
    minimumHeightInCentimeters:
        115, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/carousel.jpg',
  ),
  Ride(
    name: 'Haunted Mansion',
    description: 'Enter if you dare for a spooky adventure!',
    minimumHeightInCentimeters:
        125, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/haunted.png',
  ),
  Ride(
    name: 'Adventure Trail',
    description: 'Navigate through challenging obstacles in the forest!',
    minimumHeightInCentimeters:
        130, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/adventure.jpg',
  ),
  Ride(
    name: 'Tea Cup Ride',
    description: 'Spin around in delightful teacups!',
    minimumHeightInCentimeters:
        120, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/teacup.jpg',
  ),
  Ride(
    name: 'Enchanted Garden',
    description: 'Discover magical flowers and creatures!',
    minimumHeightInCentimeters:
        140, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/enchanted.jpg',
  ),
  Ride(
    name: 'Pirate Ship',
    description: 'Sail the high seas on a thrilling pirate voyage!',
    minimumHeightInCentimeters:
        130, // Minimum height required for the ride in centimeters
    imagePath: 'assets/images/ship.jpg',
  ),
];
