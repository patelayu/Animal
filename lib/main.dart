import 'package:animal/screen/homepage.dart';
import 'package:animal/screen/secondpage.dart';
import 'package:animal/screen/splashpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash_page",
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "SecondPage": (context) => const SecondPage(),
        "/splash_page" : (context) => const SplashPage(),
      },
    ),
  );
}