import 'package:flutter/material.dart';

class ParkingLocation {
  final String name;
  final String address;
  final double price;

  ParkingLocation({
    required this.name,
    required this.address,
    required this.price,
  });
}

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedCarType = 'Compact'; // Default car type
  ParkingLocation? _selectedParkingLocation;

  final List<ParkingLocation> parkingLocations = [
    ParkingLocation(name: 'City Center Garage', address: '123 Main St, City', price: 10.00),
    ParkingLocation(name: 'Street Parking Lot', address: '456 Elm St, Town', price: 5.00),
    ParkingLocation(name: 'Suburban Parking Lot', address: '789 Oak St, Suburb', price: 8.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Parking Location Dropdown
            DropdownButtonFormField<ParkingLocation>(
              decoration: InputDecoration(labelText: 'Parking Location'),
              value: _selectedParkingLocation,
              items: parkingLocations.map((location) {
                return DropdownMenuItem<ParkingLocation>(
                  value: location,
                  child: Text(location.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedParkingLocation = value;
                });
              },
            ),
            SizedBox(height: 16),
            // Date Picker
            ListTile(
              title: Text('Date'),
              trailing: TextButton(
                onPressed: () => _selectDate(context),
                child: Text('${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
              ),
            ),
            // Time Picker
            ListTile(
              title: Text('Time'),
              trailing: TextButton(
                onPressed: () => _selectTime(context),
                child: Text('${_selectedTime.hour}:${_selectedTime.minute}'),
              ),
            ),
            // Car Type Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Car Type'),
              value: _selectedCarType,
              items: ['Compact', 'Sedan', 'SUV', 'Large'].map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCarType = value!;
                });
              },
            ),
            SizedBox(height: 32),
            // Reserve Button
            ElevatedButton(
              onPressed: () {
                _reserveParking();
              },
              child: Text('Reserve'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Method to show time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Method to reserve parking
  void _reserveParking() {
    if (_selectedParkingLocation != null) {
      // Perform reservation action with selected details
      String reservationDetails =
          'Parking Location: ${_selectedParkingLocation!.name}\n'
          'Address: ${_selectedParkingLocation!.address}\n'
          'Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}\n'
          'Time: ${_selectedTime.hour}:${_selectedTime.minute}\n'
          'Car Type: $_selectedCarType';
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Reservation Details'),
            content: Text(reservationDetails),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Show error message if parking location is not selected
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select a parking location.'),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}


