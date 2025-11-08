enum MessageSender { user, bot }

class ChatMessage {
  final String? text;
  final String? imagePath;
  final MessageSender sender;
  final DateTime timestamp;

  ChatMessage({
    this.text,
    this.imagePath,
    required this.sender,
    required this.timestamp,
  });

  bool get hasImage => imagePath != null && imagePath!.isNotEmpty;
  bool get hasText => text != null && text!.isNotEmpty;

  // Serialization
  Map<String, dynamic> toJson() => {
        'text': text,
        'imagePath': imagePath,
        'sender': sender.toString(),
        'timestamp': timestamp.toIso8601String(),
      };

  // Deserialization
  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        text: json['text'],
        imagePath: json['imagePath'],
        sender: MessageSender.values
            .firstWhere((e) => e.toString() == json['sender']),
        timestamp: DateTime.parse(json['timestamp']),
      );
}
