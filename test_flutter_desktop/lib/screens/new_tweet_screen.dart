// lib/screens/new_tweet_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/models/tweet.dart';

class NewTweetScreen extends StatefulWidget {
  final Function(Tweet) onTweetCreated;

  NewTweetScreen({required this.onTweetCreated});

  @override
  _NewTweetScreenState createState() => _NewTweetScreenState();
}

class _NewTweetScreenState extends State<NewTweetScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitTweet() {
    if (_controller.text.isNotEmpty) {
      final newTweet = Tweet(
        username: 'User1', // Assuming the current user is 'User1'
        content: _controller.text,
        avatarUrl: 'https://via.placeholder.com/150',
        timestamp: DateTime.now(),
        likes: 0,
        retweets: 0,
        replies: 0,
      );

      widget.onTweetCreated(newTweet);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Tweet'),
        actions: [
          TextButton(
            onPressed: _submitTweet,
            child: Text('Tweet', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          decoration: InputDecoration.collapsed(hintText: 'What\'s happening?'),
        ),
      ),
    );
  }
}
