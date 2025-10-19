import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/services/chat_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/l10n/app_localizations.dart';

class InputArea extends StatefulWidget {
  final Function(String) onSendMessage;
  final Function(String)? onSendImage;

  const InputArea({super.key, required this.onSendMessage, this.onSendImage});

  @override
  State<InputArea> createState() => _InputAreaState();
}

class _InputAreaState extends State<InputArea> {
  final TextEditingController _textController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  void _handleSend() {
    if (_textController.text.isNotEmpty) {
      widget.onSendMessage(_textController.text);
      _textController.clear();
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      // Send image message
      widget.onSendImage?.call(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context);
    final localizations = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: Row(
        children: [
          IconButton(
            icon: Icon(chatService.isListening ? Icons.mic_off : Icons.mic),
            onPressed: chatService.toggleListening,
            tooltip: localizations.voiceInput,
          ),
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: _pickImage,
            tooltip: localizations.attachImage,
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: localizations.typeMessage,
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              onSubmitted: (value) => _handleSend(),
            ),
          ),
          IconButton(icon: const Icon(Icons.send), onPressed: _handleSend),
        ],
      ),
    );
  }
}
