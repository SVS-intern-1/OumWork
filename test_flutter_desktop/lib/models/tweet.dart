// lib/models/tweet.dart
class Tweet {
  final String username;
  final String content;
  final String avatarUrl;
  final DateTime timestamp;
  final int likes;
  final int retweets;
  final int replies;

  Tweet({
    required this.username,
    required this.content,
    required this.avatarUrl,
    required this.timestamp,
    this.likes = 0,
    this.retweets = 0,
    this.replies = 0,
  });
}
