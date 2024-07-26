import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Image.asset(
                'assets/instalogo.jpg',
                width: 200.0,
                height: 100.0,
              ),
            ),
            SizedBox(height: 150.0),
            Text(
              "from",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            Image.asset(
              'assets/metalogo.png',
              width: 150.0,
              height: 70.0,
            ),
          ],
        ),
      ),
    );
  }
}
