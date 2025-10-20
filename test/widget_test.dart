// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:myapp/services/tab_service.dart';
import 'package:myapp/screens/chat_screen.dart';
import 'package:myapp/services/chat_service.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:mockito/mockito.dart';

import 'package:myapp/main.dart';

class MockFirebaseApp extends Mock implements FirebaseAppPlatform {
  @override
  String get name => 'testApp';

  @override
  FirebaseOptions get options => FirebaseOptions(
        appId: '1:1234567890:ios:42b10f3f504313b216c020',
        apiKey: 'test-api-key',
        projectId: 'test-project-id',
        messagingSenderId: '1234567890',
      );

  @override
  bool get isAutomaticDataCollectionEnabled => false;

  @override
  Future<void> setAutomaticDataCollectionEnabled(bool enabled) async {}

  @override
  Future<void> setAutomaticResourceManagementEnabled(bool enabled) async {}

  @override
  Future<void> delete() async {}
}

class MockFirebasePlatform extends FirebasePlatform with Mock {
  @override
  Future<FirebaseAppPlatform> initializeApp({
    String? name,
    FirebaseOptions? options,
  }) async {
    return MockFirebaseApp();
  }
}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    FirebasePlatform.instance = MockFirebasePlatform();
  });

  testWidgets('App starts and displays ChatScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => ChatService()),
          ChangeNotifierProvider(create: (context) => TabService()),
          ChangeNotifierProvider(create: (context) => LocaleProvider()..setLocaleFromString('en')), // Set a default locale for testing
        ],
        child: const MyApp(),
      ),
    );

    // Wait for all animations and rebuilds to complete
    await tester.pumpAndSettle();

    // Verify that the ChatScreen is displayed.
    expect(find.byType(ChatScreen), findsOneWidget);

    // Obtain the context from a widget within the tree.
    // We need to find a widget that has access to the MaterialApp context
    // and its descendants to use AppLocalizations.of(context).
    final BuildContext context = tester.element(find.byType(MaterialApp));

    expect(find.text(AppLocalizations.of(context)!.chat), findsOneWidget);
  });
}
