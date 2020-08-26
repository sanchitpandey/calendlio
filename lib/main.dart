import 'package:calendlio/screens/calendar.dart';
import 'package:calendlio/screens/home_screen.dart';
import 'package:calendlio/screens/login.dart';
import 'package:calendlio/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/login": (context) => Login(),
        "/signup": (context) => SignUp(),
        "/calendar": (context) => Calendar(),
      },
    );
  }
}
