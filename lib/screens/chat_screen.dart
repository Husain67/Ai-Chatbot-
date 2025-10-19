import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/main.dart';
import 'package:myapp/services/chat_service.dart';
import 'package:myapp/services/tab_service.dart';
import 'package:myapp/widgets/chat_bubble.dart';
import 'package:myapp/widgets/input_area.dart';
import 'package:myapp/widgets/tab_bar.dart';
import 'package:myapp/screens/about_screen.dart';
import 'package:myapp/screens/privacy_policy_screen.dart';
import 'package:myapp/screens/language_selection_screen.dart';
import 'package:myapp/screens/chat_history_screen.dart';
import 'package:myapp/models/chat_message.dart';
import 'package:myapp/l10n/app_localizations.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabService = Provider.of<TabService>(context);
    final currentTab = tabService.currentTab;
    final localizations = AppLocalizations.of(context)!;

    if (currentTab == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTab.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // print('Menu button pressed'); // Debug print
              showMenu<String>(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                items: [
                  PopupMenuItem<String>(
                    value: 'new_tab',
                    child: Row(
                      children: [
                        const Icon(Icons.tab),
                        const SizedBox(width: 8),
                        Text(localizations.newTab),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'history',
                    child: Row(
                      children: [
                        const Icon(Icons.history),
                        const SizedBox(width: 8),
                        Text(localizations.chatHistory),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: 'about',
                    child: Row(
                      children: [
                        const Icon(Icons.info),
                        const SizedBox(width: 8),
                        Text(localizations.about),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'privacy',
                    child: Row(
                      children: [
                        const Icon(Icons.privacy_tip),
                        const SizedBox(width: 8),
                        Text(localizations.privacyPolicy),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'language',
                    child: Row(
                      children: [
                        const Icon(Icons.language),
                        const SizedBox(width: 8),
                        Text(localizations.language),
                      ],
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<String>(
                    value: 'theme_light',
                    child: Row(
                      children: [
                        Icon(
                          Provider.of<ThemeProvider>(context, listen: false).themeMode ==
                                  ThemeMode.light
                              ? Icons.check
                              : Icons.light_mode,
                        ),
                        const SizedBox(width: 8),
                        Text(localizations.lightMode),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'theme_dark',
                    child: Row(
                      children: [
                        Icon(
                          Provider.of<ThemeProvider>(context, listen: false).themeMode ==
                                  ThemeMode.dark
                              ? Icons.check
                              : Icons.dark_mode,
                        ),
                        const SizedBox(width: 8),
                        Text(localizations.darkMode),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'theme_system',
                    child: Row(
                      children: [
                        Icon(
                          Provider.of<ThemeProvider>(context, listen: false).themeMode ==
                                  ThemeMode.system
                              ? Icons.check
                              : Icons.auto_mode,
                        ),
                        const SizedBox(width: 8),
                        Text(localizations.systemMode),
                      ],
                    ),
                  ),
                ],
              ).then((value) {
                if (value != null) {
                  // print('Menu selected: $value'); // Debug print
                  switch (value) {
                    case 'new_tab':
                      if (context.mounted) {
                        tabService.createNewTab();
                      }
                      break;
                    case 'history':
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatHistoryScreen(),
                          ),
                        );
                      }
                      break;
                    case 'about':
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutScreen(),
                          ),
                        );
                      }
                      break;
                    case 'privacy':
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ),
                        );
                      }
                      break;
                    case 'language':
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LanguageSelectionScreen(),
                          ),
                        );
                      }
                      break;
                    case 'theme_light':
                      if (context.mounted) {
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).setLightMode();
                      }
                      break;
                    case 'theme_dark':
                      if (context.mounted) {
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).setDarkMode();
                      }
                      break;
                    case 'theme_system':
                      if (context.mounted) {
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).setSystemMode();
                      }
                      break;
                  }
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const ChatTabBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemCount: currentTab.messages.length,
              itemBuilder: (context, index) {
                final message = currentTab.messages.reversed.toList()[index];
                return ChatBubble(message: message);
              },
            ),
          ),
          const Divider(height: 1.0),
          InputArea(
            onSendMessage: (text) {
              final chatService = Provider.of<ChatService>(
                context,
                listen: false,
              );
              chatService.sendMessage(text);
              tabService.addMessageToCurrentTab(
                ChatMessage(
                  text: text,
                  sender: MessageSender.user,
                  timestamp: DateTime.now(),
                ),
              );
            },
            onSendImage: (imagePath) {
              final chatService = Provider.of<ChatService>(
                context,
                listen: false,
              );
              chatService.sendImageMessage(imagePath);
              tabService.addMessageToCurrentTab(
                ChatMessage(
                  imagePath: imagePath,
                  sender: MessageSender.user,
                  timestamp: DateTime.now(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}