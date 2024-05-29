// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:test_flutter_desktop/models/tweet.dart';
import 'package:test_flutter_desktop/models/tweet_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Tweet> tweets = [
    Tweet(
      username: 'User1',
      content: 'This is the first tweet!',
      avatarUrl: 'https://via.placeholder.com/150',
      timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      likes: 10,
      retweets: 5,
      replies: 3,
    ),
    Tweet(
      username: 'User2',
      content: 'Hello, Twitter clone!',
      avatarUrl: 'https://via.placeholder.com/150',
      timestamp: DateTime.now().subtract(Duration(hours: 1)),
      likes: 20,
      retweets: 10,
      replies: 5,
    ),
    Tweet(
      username: 'User3',
      content: 'Flutter is amazing!',
      avatarUrl: 'https://via.placeholder.com/150',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      likes: 30,
      retweets: 15,
      replies: 8,
    ),
  ];

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Search', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Notifications', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Clone'),
      ),
      body: Center(
        child: _selectedIndex == 0
            ? ListView.builder(
                itemCount: tweets.length,
                itemBuilder: (context, index) {
                  return TweetCard(tweet: tweets[index]);
                },
              )
            : _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white, // Set the unselected icon color to white
        onTap: _onItemTapped,
      ),
    );
  }
}
