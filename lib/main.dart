import 'package:flutter/material.dart';
import 'package:musicplayer/Screens/home_page.dart';
import 'package:musicplayer/styles/dark_themeing.dart';
import 'package:musicplayer/styles/light_themeing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: lightMode,
    );
  }
}