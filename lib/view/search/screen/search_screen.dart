import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        centerTitle: true,
        title: Text(
          'Search',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cancel button also goes back
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Your Shirt',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Shirt List
            Text(
              'Shirt',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildShirtItem('New T-Shirt'),
                  _buildShirtItem('Top T-shirt'),
                  _buildShirtItem('Programmer'),
                  _buildShirtItem('Shirt'),
                  _buildShirtItem('Black Shirt'),
                  _buildShirtItem('White Shirt'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShirtItem(String shirtName) {
    return ListTile(
      leading: Icon(Icons.circle_outlined),
      title: Text(shirtName),
      onTap: () {
        // Handle item tap
      },
    );
  }
}


