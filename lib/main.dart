import 'package:customer/presentation/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:customer/presentation/screens/login/home_screen.dart';
// import 'package:customer/presentation/screens/login/launch_screen.dart';
// import 'package:customer/presentation/screens/login/login_screen.dart';
// import 'package:customer/presentation/screens/home/Home.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: "/homepage",
    debugShowCheckedModeBanner: false,
    routes: {
      // //"/": (context) => const LaunchScreen(),
      //"/home": (context) =>  HomePage(),
      // "/login": (context) => const LoginPage(),
      "/homepage": (context) => MyHomePage()
    },
  ));
}