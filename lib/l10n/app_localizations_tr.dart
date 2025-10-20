// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Flutter Chatbot';

  @override
  String get chat => 'Chat';

  @override
  String get newTab => 'New Tab';

  @override
  String get chatHistory => 'Chat History';

  @override
  String get about => 'About';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get language => 'Language';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get systemMode => 'System Mode';

  @override
  String get typeMessage => 'Type a message...';

  @override
  String get voiceInput => 'Voice Input';

  @override
  String get attachImage => 'Attach Image';

  @override
  String get send => 'Send';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String languageChanged(Object language) {
    return 'Language changed to $language';
  }

  @override
  String get renameChat => 'Rename Chat';

  @override
  String get chatName => 'Chat Name';

  @override
  String get enterNewName => 'Enter new name';

  @override
  String get rename => 'Rename';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteChat => 'Delete Chat';

  @override
  String get deleteChatConfirm =>
      'Are you sure you want to delete this chat? This action cannot be undone.';

  @override
  String get delete => 'Delete';

  @override
  String get noChatHistory => 'No chat history available';

  @override
  String get messages => 'messages';

  @override
  String lastActivity(Object date) {
    return 'Last activity: $date';
  }

  @override
  String get switchToTab => 'Switch to Tab';

  @override
  String get version => 'Version';

  @override
  String get features => 'Features';

  @override
  String get textConversations => '• Text-based conversations with AI';

  @override
  String get imageAnalysis => '• Image upload and analysis';

  @override
  String get voiceSupport => '• Voice input and output';

  @override
  String get themeSupport => '• Dark/Light theme support';

  @override
  String get multiLanguage => '• Multi-language support';

  @override
  String get developedWith => 'Developed with ❤️ using Flutter';

  @override
  String get lastUpdated => 'January 2025';

  @override
  String get informationCollected => 'Information We Collect';

  @override
  String get infoCollectedDetails =>
      '• Text messages you send to the chatbot\n• Images you upload for analysis\n• Voice recordings (if voice input is used)\n• App usage analytics';

  @override
  String get howWeUseInfo => 'How We Use Your Information';

  @override
  String get useInfoDetails =>
      '• To provide AI-powered responses to your queries\n• To analyze images you upload\n• To improve our AI models and services\n• To provide customer support';

  @override
  String get dataStorageSecurity => 'Data Storage and Security';

  @override
  String get storageDetails =>
      '• Your conversations are processed in real-time\n• Images are temporarily stored for analysis only\n• We use industry-standard encryption\n• Data is not stored permanently on our servers';

  @override
  String get thirdPartyServices => 'Third-Party Services';

  @override
  String get thirdPartyDetails =>
      '• Google Gemini AI for text and image processing\n• Firebase for app functionality\n• These services have their own privacy policies';

  @override
  String get yourRights => 'Your Rights';

  @override
  String get rightsDetails =>
      '• You can delete your conversation history\n• You can opt out of analytics\n• You can request data deletion\n• Contact us for any privacy concerns';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get contactDetails =>
      'If you have any questions about this Privacy Policy, please contact us at:\n\nEmail: privacy@flutterchatbot.com\nAddress: [Your Address Here]';
}
