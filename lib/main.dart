import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/cart_page.dart';
import 'package:flutter_project_1/pages/home_page.dart';
import 'package:flutter_project_1/pages/login_page.dart';
import 'package:flutter_project_1/utils/routes.dart';
import 'package:flutter_project_1/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/":(context) => const LoginPage(),
        MyRoutes.homeRoute:(context) => const HomePage(),
        MyRoutes.loginRoute:(context) => const LoginPage(),
        MyRoutes.cartRoute:(context) => const CartPage(),
      }
    );
  }
}
