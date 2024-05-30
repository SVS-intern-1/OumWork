// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/screens/home_screen.dart';
import 'package:flutter_twitter_clone/screens/inbox_screen.dart';
import 'package:flutter_twitter_clone/theme.dart';

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
      debugShowCheckedModeBanner: false,
      routes: {
        '/inbox': (context) => InboxScreen(),
      },
    );
  }
}
