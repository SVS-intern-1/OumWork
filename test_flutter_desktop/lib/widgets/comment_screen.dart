import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/models/tweet.dart';

class Comment {
  final String username;
  final String avatarUrl;
  final String content;

  Comment({
    required this.username,
    required this.avatarUrl,
    required this.content,
  });
}

class CommentScreen extends StatefulWidget {
  final Tweet tweet;

  CommentScreen({required this.tweet});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController _commentController = TextEditingController();

  // Dummy list of comments (replace with actual data source)
  List<Comment> comments = [
    Comment(
      username: 'User1',
      avatarUrl: 'https://via.placeholder.com/150',
      content: "Nice tweet!",
    ),
    Comment(
      username: 'User2',
      avatarUrl: 'https://via.placeholder.com/150',
      content: "Great thoughts!",
    ),
    Comment(
      username: 'User3',
      avatarUrl: 'https://via.placeholder.com/150',
      content: "Keep it up!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(comments[index].avatarUrl),
                    ),
                    title: Text(comments[index].username),
                    subtitle: Text(comments[index].content),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Write a comment...',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiline comments
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Submit comment
                String comment = _commentController.text.trim();
                if (comment.isNotEmpty) {
                  // Add the comment to the list
                  setState(() {
                    comments.add(
                      Comment(
                        username: 'User', // Replace with actual username
                        avatarUrl: 'https://via.placeholder.com/150', // Replace with actual avatar URL
                        content: comment,
                      ),
                    );
                  });
                  _commentController.clear();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
