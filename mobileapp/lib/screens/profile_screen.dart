import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Name', 'Roper Katie'),
            _buildInfoRow('Domain', 'businessanalyst'),
            _buildInfoRow('Prefrece1', 'webinars'),
            _buildInfoRow('Prefrence2', 'hackathron'),
            _buildInfoRow('Recommended Events',
                'work from home internship from learntricks edutech'),
            _buildInfoRow('Login ID', '1'),
            _buildInfoRow('Reviews',
                'The experience was exceptional, providing a great learning environment.'),
            SizedBox(height: 16.0), // Add some spacing
            ElevatedButton(
              onPressed: () {
                // Handle edit profile button press
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(value),
            ),
          ),
        ],
      ),
    );
  }
}
