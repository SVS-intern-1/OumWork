import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/screens/home_screen.dart';

void main() {
  runApp(FacebookCloneApp());
}

class FacebookCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,  // This line removes the debug banner
      // debugShowMaterialGrid: true,
    );
  }
}
