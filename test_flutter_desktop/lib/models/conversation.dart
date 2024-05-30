// lib/models/conversation.dart
import 'message.dart';

class Conversation {
  final String id;
  final String username;
  final String avatarUrl;
  final List<Message> messages;

  Conversation({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.messages,
  });
}
