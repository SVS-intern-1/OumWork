// lib/models/tweet_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/models/tweet.dart';
import 'package:intl/intl.dart';

class TweetCard extends StatefulWidget {
  final Tweet tweet;

  TweetCard({required this.tweet});

  @override
  _TweetCardState createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.tweet.avatarUrl),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tweet.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        DateFormat('yyyy-MM-dd – kk:mm').format(widget.tweet.timestamp),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(widget.tweet.content),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {},
                ),
                Text('${widget.tweet.replies}'),
                IconButton(
                  icon: Icon(Icons.repeat),
                  onPressed: () {},
                ),
                Text('${widget.tweet.retweets}'),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.pink : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                Text('${widget.tweet.likes}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
