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
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:mockito/mockito.dart' as Mockito;

import 'package:myapp/main.dart';

// A helper function to set up a mock Firebase platform.
void setupFirebaseForTesting() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // This mocks the Firebase platform so that Firebase.initializeApp doesn't try to talk to native code.
  FirebaseCorePlatform.instance = _MockFirebaseCore();
}

class _MockFirebaseCore extends Mockito.Mock implements FirebaseCorePlatform {
  @override
  Future<FirebaseAppPlatform> initializeApp({
    required String name,
    FirebaseOptions? options,
  }) async {
    return _MockFirebaseApp();
  }
}

class _MockFirebaseApp extends Mockito.Mock implements FirebaseAppPlatform {}

// class Mock extends Fake implements Mockito.Mock {
//   // Override noSuchMethod to allow mocking of any method.
//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }

void main() {
  setUpAll(() async {
    setupFirebaseForTesting();
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
