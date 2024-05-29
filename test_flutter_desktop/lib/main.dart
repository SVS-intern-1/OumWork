// lib/main.dart
import 'package:flutter/material.dart';
import 'package:test_flutter_desktop/screens/homescreen.dart';
import 'package:test_flutter_desktop/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: darkTheme,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
    );
  }
}
