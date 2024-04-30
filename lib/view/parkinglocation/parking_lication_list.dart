import 'package:flutter/material.dart';

class ParkingLocation {
  final String name;
  final String address;
  final double rating;
  final double price;
  final String imageUrl;

  ParkingLocation({
    required this.name,
    required this.address,
    required this.rating,
    required this.price,
    required this.imageUrl,
  });
}

class ParkingLocationListScreen extends StatelessWidget {
  final List<ParkingLocation> parkingLocations = [
    ParkingLocation(
      name: 'City Center Garage',
      address: '123 Main St, City',
      rating: 4.5,
      price: 10.00,
      imageUrl: 'assets/city_center_garage.jpg',
    ),
    ParkingLocation(
      name: 'Street Parking Lot',
      address: '456 Elm St, Town',
      rating: 4.0,
      price: 5.00,
      imageUrl: 'assets/street_parking_lot.jpg',
    ),
    ParkingLocation(
      name: 'Suburban Parking Lot',
      address: '789 Oak St, Suburb',
      rating: 4.2,
      price: 8.00,
      imageUrl: 'assets/suburban_parking_lot.jpg',
    ),
    // Add more parking locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Locations'),
      ),
      body: ListView.builder(
        itemCount: parkingLocations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              parkingLocations[index].imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(parkingLocations[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(parkingLocations[index].address),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(parkingLocations[index].rating.toString()),
                  ],
                ),
              ],
            ),
            trailing: Text('\$${parkingLocations[index].price.toStringAsFixed(2)}'),
            onTap: () {
              // Implement onTap action (e.g., navigate to parking location details screen)
            },
          );
        },
      ),
    );
  }
}

