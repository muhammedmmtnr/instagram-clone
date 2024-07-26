import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 10, // Number of notifications
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with user's profile image
                ),
                title: Text('John Doe'), // Replace with user's name
                subtitle: Text('Liked your photo'), // Replace with notification content
                trailing: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'View',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {
                  // Handle notification tap
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
