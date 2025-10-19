import 'package:myapp/models/chat_message.dart';

class ChatTab {
  final String id;
  final String title;
  final List<ChatMessage> messages;
  final DateTime createdAt;
  DateTime lastActivity;

  ChatTab({
    required this.id,
    required this.title,
    required this.messages,
    required this.createdAt,
    DateTime? lastActivity,
  }) : lastActivity = lastActivity ?? createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'messages': messages
          .map(
            (msg) => {
              'text': msg.text,
              'imagePath': msg.imagePath,
              'sender': msg.sender == MessageSender.user ? 'user' : 'bot',
              'timestamp': msg.timestamp.toIso8601String(),
            },
          )
          .toList(),
      'createdAt': createdAt.toIso8601String(),
      'lastActivity': lastActivity.toIso8601String(),
    };
  }

  factory ChatTab.fromJson(Map<String, dynamic> json) {
    return ChatTab(
      id: json['id'],
      title: json['title'],
      messages: (json['messages'] as List)
          .map(
            (msg) => ChatMessage(
              text: msg['text'],
              imagePath: msg['imagePath'],
              sender: msg['sender'] == 'user'
                  ? MessageSender.user
                  : MessageSender.bot,
              timestamp: DateTime.parse(msg['timestamp']),
            ),
          )
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      lastActivity: DateTime.parse(json['lastActivity']),
    );
  }

  ChatTab copyWith({
    String? id,
    String? title,
    List<ChatMessage>? messages,
    DateTime? createdAt,
    DateTime? lastActivity,
  }) {
    return ChatTab(
      id: id ?? this.id,
      title: title ?? this.title,
      messages: messages ?? this.messages,
      createdAt: createdAt ?? this.createdAt,
      lastActivity: lastActivity ?? this.lastActivity,
    );
  }
}
