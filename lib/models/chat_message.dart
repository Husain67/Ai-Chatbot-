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
}
