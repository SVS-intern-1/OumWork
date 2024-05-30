// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/models/tweet.dart';
import 'package:flutter_twitter_clone/widgets/tweet_card.dart';
import 'package:flutter_twitter_clone/screens/profile_screen.dart';
import 'package:flutter_twitter_clone/screens/search_screen.dart';
import 'package:flutter_twitter_clone/screens/notification_screen.dart';
import 'package:flutter_twitter_clone/screens/new_tweet_screen.dart';
import 'package:flutter_twitter_clone/screens/inbox_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Assuming the current user is 'User1'
  final String currentUser = 'User1';

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

  void _addNewTweet(Tweet tweet) {
    setState(() {
      tweets.insert(0, tweet); // Insert new tweet at the top
    });
  }

  Widget _buildScreen() {
    List<Tweet> currentUserTweets = tweets.where((tweet) => tweet.username == currentUser).toList();

    switch (_selectedIndex) {
      case 0:
        return ListView.builder(
          itemCount: tweets.length,
          itemBuilder: (context, index) {
            return TweetCard(tweet: tweets[index]);
          },
        );
      case 1:
        return SearchScreen();
      case 2:
        return NotificationScreen();
      case 3:
        return ProfileScreen(userTweets: currentUserTweets);
      case 4:
        return InboxScreen();
      default:
        return Center(
          child: Text('Home', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        );
    }
  }

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
      body: _buildScreen(),
      floatingActionButton: (_selectedIndex == 0 || _selectedIndex == 3)
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewTweetScreen(onTweetCreated: _addNewTweet),
                  ),
                );
              },
              child: Icon(Icons.add),
            )
          : null,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Inbox',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
