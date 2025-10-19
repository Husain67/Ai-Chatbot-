// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'फ्लटर चैटबॉट';

  @override
  String get chat => 'चैट';

  @override
  String get newTab => 'नया टैब';

  @override
  String get chatHistory => 'चैट इतिहास';

  @override
  String get about => 'हमारे बारे में';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get language => 'भाषा';

  @override
  String get lightMode => 'लाइट मोड';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get systemMode => 'सिस्टम मोड';

  @override
  String get typeMessage => 'एक संदेश टाइप करें...';

  @override
  String get voiceInput => 'वॉइस इनपुट';

  @override
  String get attachImage => 'छवि संलग्न करें';

  @override
  String get send => 'भेजें';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String languageChanged(Object language) {
    return 'भाषा बदलकर $language कर दी गई';
  }

  @override
  String get renameChat => 'चैट का नाम बदलें';

  @override
  String get chatName => 'चैट का नाम';

  @override
  String get enterNewName => 'नया नाम दर्ज करें';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get deleteChat => 'चैट हटाएं';

  @override
  String get deleteChatConfirm => 'क्या आप वाकई इस चैट को हटाना चाहते हैं? यह क्रिया वापस नहीं की जा सकती।';

  @override
  String get delete => 'हटाएं';

  @override
  String get noChatHistory => 'कोई चैट इतिहास उपलब्ध नहीं है';

  @override
  String get messages => 'संदेश';

  @override
  String lastActivity(Object date) {
    return 'अंतिम गतिविधि: $date';
  }

  @override
  String get switchToTab => 'टैब पर स्विच करें';

  @override
  String get version => 'संस्करण';

  @override
  String get features => 'सुविधाएं';

  @override
  String get textConversations => '• AI के साथ टेक्स्ट-आधारित बातचीत';

  @override
  String get imageAnalysis => '• छवि अपलोड और विश्लेषण';

  @override
  String get voiceSupport => '• वॉइस इनपुट और आउटपुट';

  @override
  String get themeSupport => '• डार्क/लाइट थीम समर्थन';

  @override
  String get multiLanguage => '• बहु-भाषा समर्थन';

  @override
  String get developedWith => '❤️ के साथ फ्लटर का उपयोग करके विकसित';

  @override
  String get lastUpdated => 'अंतिम अपडेट: जनवरी 2025';

  @override
  String get informationCollected => 'जानकारी हम एकत्र करते हैं';

  @override
  String get infoCollectedDetails => '• आपके द्वारा चैटबॉट को भेजे गए टेक्स्ट संदेश\n• विश्लेषण के लिए आपकी अपलोड की गई छवियां\n• वॉइस रिकॉर्डिंग (यदि वॉइस इनपुट का उपयोग किया गया)\n• ऐप उपयोग एनालिटिक्स';

  @override
  String get howWeUseInfo => 'हम आपकी जानकारी का उपयोग कैसे करते हैं';

  @override
  String get useInfoDetails => '• आपके प्रश्नों के लिए AI-संचालित प्रतिक्रियाएं प्रदान करने के लिए\n• आपकी अपलोड की गई छवियों का विश्लेषण करने के लिए\n• हमारे AI मॉडल और सेवाओं में सुधार करने के लिए\n• ग्राहक सहायता प्रदान करने के लिए';

  @override
  String get dataStorageSecurity => 'डेटा संग्रहण और सुरक्षा';

  @override
  String get storageDetails => '• आपकी बातचीत वास्तविक समय में संसाधित की जाती है\n• छवियां केवल विश्लेषण के लिए अस्थायी रूप से संग्रहीत की जाती हैं\n• हम उद्योग-मानक एन्क्रिप्शन का उपयोग करते हैं\n• डेटा हमारे सर्वर पर स्थायी रूप से संग्रहीत नहीं किया जाता';

  @override
  String get thirdPartyServices => 'तृतीय-पक्ष सेवाएं';

  @override
  String get thirdPartyDetails => '• टेक्स्ट और छवि प्रसंस्करण के लिए Google Gemini AI\n• ऐप कार्यक्षमता के लिए Firebase\n• इन सेवाओं की अपनी गोपनीयता नीतियां हैं';

  @override
  String get yourRights => 'आपके अधिकार';

  @override
  String get rightsDetails => '• आप अपनी बातचीत इतिहास को हटा सकते हैं\n• आप एनालिटिक्स से ऑप्ट आउट कर सकते हैं\n• आप डेटा हटाने का अनुरोध कर सकते हैं\n• किसी भी गोपनीयता चिंता के लिए हमसे संपर्क करें';

  @override
  String get contactUs => 'हमसे संपर्क करें';

  @override
  String get contactDetails => 'यदि इस गोपनीयता नीति के बारे में आपके कोई प्रश्न हैं, तो कृपया हमसे संपर्क करें:\n\nईमेल: privacy@flutterchatbot.com\nपता: [आपका पता यहां]';
}
