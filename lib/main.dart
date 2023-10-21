import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/home_page.dart';
import 'package:flutter_project_1/pages/login_page.dart';
import 'package:flutter_project_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/Home",
      routes: {
        "/":(context) => const LoginPage(),
        MyRoutes.homeRoute:(context) => const HomePage(),
        "/Login":(context) => const LoginPage(),
      }
    );
  }
}
