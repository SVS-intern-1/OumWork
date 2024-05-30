import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/models/post.dart';
import 'package:flutter_facebook_clone/widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Post> posts = [
    Post(
      id: '1',
      content: 'Hello, world!',
      imageUrl: 'https://example.com/image1.jpg',
      authorId: '1',
      timestamp: DateTime.now(),
    ),
    // Add more posts here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Clone'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStorySection(),
            Divider(),
            _buildPostCreationSection(),
            Divider(),
            _buildPostFeed(),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStoryCard('https://example.com/user1.jpg', 'User 1'),
          _buildStoryCard('https://example.com/user2.jpg', 'User 2'),
          _buildStoryCard('https://example.com/user3.jpg', 'User 3'),
          // Add more stories here
        ],
      ),
    );
  }

  Widget _buildStoryCard(String imageUrl, String userName) {
    return Container(
      width: 80,
      margin: EdgeInsets.all(5.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 5),
          Text(
            userName,
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildPostCreationSection() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://example.com/user1.jpg'),
      ),
      title: TextField(
        decoration: InputDecoration(
          hintText: "What's on your mind?",
          border: InputBorder.none,
        ),
      ),
      trailing: Icon(Icons.photo_album, color: Colors.green),
    );
  }

  Widget _buildPostFeed() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostWidget(post: posts[index]);
      },
    );
  }
}
