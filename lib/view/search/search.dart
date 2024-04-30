import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _selectedCarType = 'Compact'; // Default car type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            // Search Button
            ElevatedButton(
              onPressed: () {
                _searchParking();
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }

  // Method to search for parking
  void _searchParking() {
    // Perform search action with selected criteria
    String searchCriteria = 'Car Type: $_selectedCarType';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Search Criteria'),
          content: Text(searchCriteria),
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

