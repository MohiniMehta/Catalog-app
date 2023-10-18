import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/home_page.dart';
import 'package:flutter_project_1/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/Home",
      routes: {
        "/":(context) => const LoginPage(),
        "/Home":(context) => const HomePage(),
        "/Login":(context) => const LoginPage(),
      }
    );
  }
}
