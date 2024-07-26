import 'package:flutter/material.dart';
import 'package:instagram/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstagramSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Navigate to notifications settings page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Privacy and Security'),
            onTap: () {
              // Navigate to privacy and security settings page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              // Navigate to help page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool("isLoggedIn", false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                // Perform the logout action
              );
            },
          ),
        ],
      ),
    );
  }
}
