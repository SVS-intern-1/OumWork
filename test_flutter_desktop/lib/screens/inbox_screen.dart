// lib/screens/inbox_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/models/conversation.dart';
import 'package:flutter_twitter_clone/models/message.dart';
import 'chat_screen.dart';

class InboxScreen extends StatelessWidget {
  final List<Conversation> conversations = [
    Conversation(
      id: '1',
      username: 'User1',
      avatarUrl: 'https://via.placeholder.com/150',
      messages: [
        Message(sender: 'User1', content: 'Hello!', timestamp: DateTime.now().subtract(Duration(minutes: 5))),
        Message(sender: 'CurrentUser', content: 'Hi!', timestamp: DateTime.now().subtract(Duration(minutes: 3))),
      ],
    ),
    Conversation(
      id: '2',
      username: 'User2',
      avatarUrl: 'https://via.placeholder.com/150',
      messages: [
        Message(sender: 'User2', content: 'How are you?', timestamp: DateTime.now().subtract(Duration(minutes: 10))),
        Message(sender: 'CurrentUser', content: 'I am good, thanks!', timestamp: DateTime.now().subtract(Duration(minutes: 8))),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (context, index) {
          final conversation = conversations[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(conversation.avatarUrl),
            ),
            title: Text(conversation.username),
            subtitle: Text(conversation.messages.last.content),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(conversation: conversation),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
