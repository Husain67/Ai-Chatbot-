import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primarySeedColor = Color(0xFF008080); // Teal

    final TextTheme appTextTheme = TextTheme(
      displayLarge: GoogleFonts.oswald(
          fontSize: 57, fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.roboto(
          fontSize: 22, fontWeight: FontWeight.w500),
      bodyMedium: GoogleFonts.openSans(fontSize: 14),
    );

    final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primarySeedColor,
        brightness: Brightness.light,
      ),
      textTheme: appTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );

    final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primarySeedColor,
        brightness: Brightness.dark,
      ),
      textTheme: appTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
    );

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'miniBot',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          home: const ChatPage(),
        );
      },
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'user');
  final _bot = const types.User(id: 'bot', firstName: 'miniBot');
  final _model = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');

  @override
  void initState() {
    super.initState();
    _addMessage(types.TextMessage(
      author: _bot,
      id: const Uuid().v4(),
      text: 'Hello! How can I help you today?',
    ));
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final userMessage = types.TextMessage(
      author: _user,
      id: const Uuid().v4(),
      text: message.text,
    );
    _addMessage(userMessage);

    final botTypingMessage = types.TextMessage(
      author: _bot,
      id: const Uuid().v4(),
      text: '...',
    );
    _addMessage(botTypingMessage);

    try {
      final response = await _model.generateContent([Content.text(message.text)]);
      final botMessage = types.TextMessage(
        author: _bot,
        id: const Uuid().v4(),
        text: response.text ?? 'Sorry, I could not process that.',
      );

      setState(() {
        _messages.removeAt(0);
      });
      _addMessage(botMessage);
    } catch (e) {
      setState(() {
        _messages.removeAt(0);
      });
      final errorMessage = types.TextMessage(
        author: _bot,
        id: const Uuid().v4(),
        text: 'Error: ${e.toString()}',
      );
      _addMessage(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'miniBot',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            const SizedBox(width: 8),
            const Icon(Icons.chat_bubble_outline),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        theme: DefaultChatTheme(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          inputBackgroundColor: const Color(0xFF008080), // Teal
          inputTextColor: Colors.white,
          primaryColor: const Color(0xFF008080), // Teal
          secondaryColor: Colors.grey.shade200,
          sentMessageBodyTextStyle: const TextStyle(color: Colors.white),
          receivedMessageBodyTextStyle: const TextStyle(color: Colors.black),
          inputContainerDecoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
        ),
      ),
    );
  }
}

