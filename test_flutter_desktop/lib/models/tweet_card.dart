// lib/widgets/tweet_card.dart
import 'package:flutter/material.dart';
import 'package:test_flutter_desktop/models/tweet.dart';
import 'package:intl/intl.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;

  const TweetCard({super.key, required this.tweet});

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
                  backgroundImage: NetworkImage(tweet.avatarUrl),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tweet.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        DateFormat('yyyy-MM-dd – kk:mm').format(tweet.timestamp),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(tweet.content),
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
                Text('${tweet.replies}'),
                IconButton(
                  icon: Icon(Icons.repeat),
                  onPressed: () {},
                ),
                Text('${tweet.retweets}'),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                Text('${tweet.likes}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
