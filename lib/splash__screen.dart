import 'dart:async';
import 'package:calculator_app/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splash.jpg",
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 32,
            ),
            Image.asset(
              "assets/images/trf.png",
              height: 128,
              width: 128,
            ),
            Image.asset(
              "assets/images/robodroid.jpg",
              height: 128,
              width: 256,
            ),
          ],
        ),
      ),
    );
  }
}
