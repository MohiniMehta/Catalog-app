import 'package:flutter/material.dart';
 // ignore: camel_case_types
 class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: Text("LoginPage",
                   style: TextStyle(fontSize: 20, 
                                    color: Colors.blue, 
                                    fontWeight: FontWeight.bold),
      ),
      ),
    );
  }
}