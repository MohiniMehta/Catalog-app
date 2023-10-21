import "package:flutter/material.dart";
import "package:flutter_project_1/widgets/drawer.dart";

 class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: const Center(
          child: Text("Welcome to the app made by Mohini"),
        ),
        drawer: const MyDrawer(),
      );
  }
}