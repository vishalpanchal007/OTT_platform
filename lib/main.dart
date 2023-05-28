import 'dart:async';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(StreamApp());
}

class StreamApp extends StatelessWidget {
  const StreamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StreamHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StreamgiHome()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.stream_rounded,
              color: Colors.red,
              size: 100,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'StreamHub App',
            style: TextStyle(
                fontSize: 30,
                color: Colors.indigo,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}