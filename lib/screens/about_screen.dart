import 'package:flutter/material.dart';
import 'package:myapp/l10n/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(localizations.about)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.appTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('${localizations.version}: 1.0.0', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'This is an AI-powered chatbot built with Flutter and Google Gemini. '
              'It can help you with text conversations and image analysis.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Text(
              localizations.features,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(localizations.textConversations),
            Text(localizations.imageAnalysis),
            Text(localizations.voiceSupport),
            Text(localizations.themeSupport),
            Text(localizations.multiLanguage),
            const SizedBox(height: 24),
            Text(
              localizations.developedWith,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
