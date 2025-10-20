import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Chatbot'**
  String get appTitle;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @newTab.
  ///
  /// In en, this message translates to:
  /// **'New Tab'**
  String get newTab;

  /// No description provided for @chatHistory.
  ///
  /// In en, this message translates to:
  /// **'Chat History'**
  String get chatHistory;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'System Mode'**
  String get systemMode;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get typeMessage;

  /// No description provided for @voiceInput.
  ///
  /// In en, this message translates to:
  /// **'Voice Input'**
  String get voiceInput;

  /// No description provided for @attachImage.
  ///
  /// In en, this message translates to:
  /// **'Attach Image'**
  String get attachImage;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed to {language}'**
  String languageChanged(Object language);

  /// No description provided for @renameChat.
  ///
  /// In en, this message translates to:
  /// **'Rename Chat'**
  String get renameChat;

  /// No description provided for @chatName.
  ///
  /// In en, this message translates to:
  /// **'Chat Name'**
  String get chatName;

  /// No description provided for @enterNewName.
  ///
  /// In en, this message translates to:
  /// **'Enter new name'**
  String get enterNewName;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @deleteChat.
  ///
  /// In en, this message translates to:
  /// **'Delete Chat'**
  String get deleteChat;

  /// No description provided for @deleteChatConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this chat? This action cannot be undone.'**
  String get deleteChatConfirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @noChatHistory.
  ///
  /// In en, this message translates to:
  /// **'No chat history available'**
  String get noChatHistory;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'messages'**
  String get messages;

  /// No description provided for @lastActivity.
  ///
  /// In en, this message translates to:
  /// **'Last activity: {date}'**
  String lastActivity(Object date);

  /// No description provided for @switchToTab.
  ///
  /// In en, this message translates to:
  /// **'Switch to Tab'**
  String get switchToTab;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @textConversations.
  ///
  /// In en, this message translates to:
  /// **'• Text-based conversations with AI'**
  String get textConversations;

  /// No description provided for @imageAnalysis.
  ///
  /// In en, this message translates to:
  /// **'• Image upload and analysis'**
  String get imageAnalysis;

  /// No description provided for @voiceSupport.
  ///
  /// In en, this message translates to:
  /// **'• Voice input and output'**
  String get voiceSupport;

  /// No description provided for @themeSupport.
  ///
  /// In en, this message translates to:
  /// **'• Dark/Light theme support'**
  String get themeSupport;

  /// No description provided for @multiLanguage.
  ///
  /// In en, this message translates to:
  /// **'• Multi-language support'**
  String get multiLanguage;

  /// No description provided for @developedWith.
  ///
  /// In en, this message translates to:
  /// **'Developed with ❤️ using Flutter'**
  String get developedWith;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: January 2025'**
  String get lastUpdated;

  /// No description provided for @informationCollected.
  ///
  /// In en, this message translates to:
  /// **'Information We Collect'**
  String get informationCollected;

  /// No description provided for @infoCollectedDetails.
  ///
  /// In en, this message translates to:
  /// **'• Text messages you send to the chatbot\n• Images you upload for analysis\n• Voice recordings (if voice input is used)\n• App usage analytics'**
  String get infoCollectedDetails;

  /// No description provided for @howWeUseInfo.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Information'**
  String get howWeUseInfo;

  /// No description provided for @useInfoDetails.
  ///
  /// In en, this message translates to:
  /// **'• To provide AI-powered responses to your queries\n• To analyze images you upload\n• To improve our AI models and services\n• To provide customer support'**
  String get useInfoDetails;

  /// No description provided for @dataStorageSecurity.
  ///
  /// In en, this message translates to:
  /// **'Data Storage and Security'**
  String get dataStorageSecurity;

  /// No description provided for @storageDetails.
  ///
  /// In en, this message translates to:
  /// **'• Your conversations are processed in real-time\n• Images are temporarily stored for analysis only\n• We use industry-standard encryption\n• Data is not stored permanently on our servers'**
  String get storageDetails;

  /// No description provided for @thirdPartyServices.
  ///
  /// In en, this message translates to:
  /// **'Third-Party Services'**
  String get thirdPartyServices;

  /// No description provided for @thirdPartyDetails.
  ///
  /// In en, this message translates to:
  /// **'• Google Gemini AI for text and image processing\n• Firebase for app functionality\n• These services have their own privacy policies'**
  String get thirdPartyDetails;

  /// No description provided for @yourRights.
  ///
  /// In en, this message translates to:
  /// **'Your Rights'**
  String get yourRights;

  /// No description provided for @rightsDetails.
  ///
  /// In en, this message translates to:
  /// **'• You can delete your conversation history\n• You can opt out of analytics\n• You can request data deletion\n• Contact us for any privacy concerns'**
  String get rightsDetails;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about this Privacy Policy, please contact us at:\n\nEmail: privacy@flutterchatbot.com\nAddress: [Your Address Here]'**
  String get contactDetails;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'de',
    'en',
    'es',
    'fa',
    'fr',
    'hi',
    'it',
    'ja',
    'ko',
    'nl',
    'pt',
    'ru',
    'sv',
    'th',
    'tr',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
