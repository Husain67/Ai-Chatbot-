import 'package:flutter/material.dart';
import 'package:myapp/models/chat_message.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart' as genai;

class ChatService with ChangeNotifier {
  final List<ChatMessage> _messages = [];

  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  bool _isListening = false;
  late genai.GenerativeModel _model;

  List<ChatMessage> get messages => _messages;
  bool get isListening => _isListening;

  ChatService() {
    _initSpeech();
    _initGemini();
  }

  void _initGemini() {
    /// Initialize Gemini AI model with API key from environment variable.
    /// 
    /// SETUP REQUIRED:
    /// 1. Get your API key from: https://console.cloud.google.com/apis/credentials
    /// 2. Enable "Generative Language API" in Google Cloud Console
    /// 3. Run the app with: flutter run --dart-define=GEMINI_API_KEY=your_key_here
    /// 
    /// For development, you can also set the environment variable:
    /// export GEMINI_API_KEY=your_key_here
    /// 
    /// ⚠️ SECURITY WARNING: Never commit API keys to version control!
    /// Always use environment variables or secure key management.
    const String geminiApiKey = String.fromEnvironment(
      'GEMINI_API_KEY',
      defaultValue: 'YOUR_GEMINI_API_KEY_HERE',
    );
    
    if (geminiApiKey == 'YOUR_GEMINI_API_KEY_HERE') {
      debugPrint(
        '⚠️ WARNING: Gemini API key not configured!\n'
        'Please set GEMINI_API_KEY environment variable.\n'
        'Run: flutter run --dart-define=GEMINI_API_KEY=your_key_here',
      );
    }
    
    _model = genai.GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: geminiApiKey,
    );
  }

  void _initSpeech() async {
    await _speech.initialize();
  }

  void sendMessage(String text) {
    if (text.isEmpty) return;
    _addMessage(text, MessageSender.user);
    _getBotResponse(text);
  }

  void sendImageMessage(String imagePath) {
    _addMessage(null, MessageSender.user, imagePath: imagePath);
    _getBotResponseForImage(imagePath);
  }

  Future<void> _getBotResponseForImage(String imagePath) async {
    // Check network connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      _addMessage(
        'Sorry, I need internet connection to analyze images. Please check your network and try again.',
        MessageSender.bot,
        speak: true,
      );
      return;
    }

    try {
      final imageBytes = await File(imagePath).readAsBytes();
      final content = [
        genai.Content.multi([
          genai.TextPart(
            'Please analyze this image and describe what you see.',
          ),
          genai.DataPart('image/jpeg', imageBytes),
        ]),
      ];

      final response = await _model.generateContent(content);
      final botMessage =
          response.text ?? 'Sorry, I couldn\'t analyze the image.';
      _addMessage(botMessage, MessageSender.bot, speak: true);
    } catch (e) {
      _addMessage(
        'Sorry, I\'m having trouble analyzing the image. Please try again.',
        MessageSender.bot,
        speak: true,
      );
    }
  }

  void toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          sendMessage(result.recognizedWords);
        }
      },
    );
    _isListening = true;
    notifyListeners();
  }

  void _stopListening() {
    _speech.stop();
    _isListening = false;
    notifyListeners();
  }

  void _addMessage(
    String? text,
    MessageSender sender, {
    bool speak = false,
    String? imagePath,
  }) {
    _messages.add(
      ChatMessage(
        text: text,
        imagePath: imagePath,
        sender: sender,
        timestamp: DateTime.now(),
      ),
    );
    if (speak && text != null) {
      _speak(text);
    }
    notifyListeners();
  }

  Future<void> _getBotResponse(String userMessage) async {
    // Check network connectivity
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      _addMessage(
        'Sorry, I need internet connection to respond. Please check your network and try again.',
        MessageSender.bot,
        speak: true,
      );
      return;
    }

    try {
      final response = await _model.generateContent([
        genai.Content.text(userMessage),
      ]);
      final botMessage =
          response.text ?? 'Sorry, I couldn\'t generate a response.';
      _addMessage(botMessage, MessageSender.bot, speak: true);
    } catch (e) {
      _addMessage(
        'Sorry, I\'m having trouble connecting to my AI service. Please check your internet connection and try again.',
        MessageSender.bot,
        speak: true,
      );
    }
  }

  Future<void> _speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }
}
