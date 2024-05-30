import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/post.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/user1.jpg'),
            ),
            title: Text('User Name'),
            subtitle: Text(widget.post.timestamp.toString()),
            trailing: IconButton(
              icon: Icon(_isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined),
              color: _isLiked ? Colors.blue : Colors.grey,
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                  print('Like button pressed: $_isLiked');
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(widget.post.content),
          ),
          if (widget.post.imageUrl.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.network(widget.post.imageUrl),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  label: Text('Like'),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                      print('Like button pressed: $_isLiked');
                    });
                  },
                ),
                TextButton.icon(
                  icon: Icon(Icons.comment_outlined),
                  label: Text('Comment'),
                  onPressed: () {},
                ),
                TextButton.icon(
                  icon: Icon(Icons.share_outlined),
                  label: Text('Share'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
