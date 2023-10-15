import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        // ignore: prefer_const_constructors
        body: Center(
          child: const Text("Welcome to the app made by Mohini"),
        ),
      ),
    );
  }
}

