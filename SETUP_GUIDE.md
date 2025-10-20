# Setup Guide - Flutter AI Chatbot

This guide will help you set up and run the Flutter AI Chatbot application.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.9.0 or higher) - [Download](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **Xcode** (for mobile development)
- **Git** (for version control)

## Step 1: Clone the Repository

```bash
git clone <repository-url>
cd myapp
```

## Step 2: Install Flutter Dependencies

```bash
flutter pub get
```

This will download all required packages listed in `pubspec.yaml`.

## Step 3: Set Up Poppins Font (Required)

The app uses the Poppins font for custom typography. Follow these steps:

### Option A: Download from Google Fonts (Recommended)

1. Visit [Google Fonts - Poppins](https://fonts.google.com/specimen/Poppins)
2. Click "Download family"
3. Extract the ZIP file
4. Copy these files to `assets/fonts/`:
   - `Poppins-Regular.ttf`
   - `Poppins-SemiBold.ttf`
   - `Poppins-Bold.ttf`

### Option B: Use Command Line

```bash
# Create fonts directory if it doesn't exist
mkdir -p assets/fonts

# Download Poppins font files (you'll need to do this manually or use a script)
# Then place them in assets/fonts/
```

**Verify the setup:**
```bash
ls -la assets/fonts/
# Should show:
# Poppins-Regular.ttf
# Poppins-SemiBold.ttf
# Poppins-Bold.ttf
```

## Step 4: Configure Gemini API Key

### Get Your API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the "Generative Language API"
4. Go to "Credentials" and create an API key
5. Copy the API key

### Set the API Key

**Option A: Using Environment Variable (Recommended)**

```bash
flutter run --dart-define=GEMINI_API_KEY=your_actual_api_key_here
```

**Option B: Update Code (Development Only)**

Edit `lib/services/chat_service.dart`:
```dart
const String geminiApiKey = 'your_actual_api_key_here';
```

⚠️ **Security Warning**: Never commit API keys to version control. Use environment variables for production.

## Step 5: Configure Firebase (Optional)

Firebase is already configured in the app. If you need to update it:

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

This will update `lib/firebase_options.dart` with your Firebase project details.

## Step 6: Run the Application

### For Android Emulator

```bash
# Start Android emulator first
emulator -avd <emulator_name>

# Then run the app
flutter run
```

### For iOS Simulator

```bash
# Start iOS simulator
open -a Simulator

# Then run the app
flutter run
```

### For Web

```bash
flutter run -d chrome
```

### For macOS

```bash
flutter run -d macos
```

## Step 7: Verify Installation

Once the app is running:

1. **Check Chat Screen**: You should see the main chat interface
2. **Test AI Chat**: Type a message and verify you get a response
3. **Test Voice Input**: Click the microphone icon to test speech-to-text
4. **Test Image Upload**: Click the attachment icon to upload an image
5. **Test Language**: Go to menu → Language and switch languages
6. **Test Theme**: Go to menu → Theme and switch between Light/Dark/System

## Troubleshooting

### Issue: Font Loading Error

**Error**: `Failed to load font Poppins`

**Solution**:
1. Verify font files are in `assets/fonts/`
2. Run `flutter clean`
3. Run `flutter pub get`
4. Run `flutter run`

### Issue: Gemini API Error

**Error**: `Invalid API key` or `API not enabled`

**Solution**:
1. Verify your API key is correct
2. Check that Generative Language API is enabled in Google Cloud Console
3. Ensure the API key has appropriate permissions
4. Try creating a new API key

### Issue: Speech-to-Text Not Working

**Error**: `Speech recognition failed`

**Solution**:
1. Check microphone permissions on your device
2. Ensure internet connection is available
3. Try restarting the app
4. Check device language settings

### Issue: Image Upload Not Working

**Error**: `Failed to pick image`

**Solution**:
1. Check storage permissions on your device
2. Ensure you have images in your gallery
3. Try using a different image
4. Restart the app

### Issue: Chat History Not Saving

**Error**: Messages disappear after app restart

**Solution**:
1. Check app storage permissions
2. Ensure device has sufficient storage space
3. Clear app cache: `flutter clean`
4. Reinstall the app

### Issue: App Crashes on Startup

**Error**: `Exception: ...`

**Solution**:
1. Run `flutter clean`
2. Run `flutter pub get`
3. Check for any error messages in the console
4. Verify all dependencies are installed correctly

## Development Commands

### Clean Build
```bash
flutter clean
flutter pub get
flutter run
```

### Run with Verbose Output
```bash
flutter run -v
```

### Build APK (Android)
```bash
flutter build apk --release
```

### Build IPA (iOS)
```bash
flutter build ios --release
```

### Build Web
```bash
flutter build web --release
```

### Run Tests
```bash
flutter test
```

### Format Code
```bash
dart format lib/
```

### Analyze Code
```bash
flutter analyze
```

## Project Structure Overview

```
myapp/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── screens/                     # UI screens
│   ├── services/                    # Business logic
│   ├── models/                      # Data models
│   ├── widgets/                     # Reusable components
│   ├── l10n/                        # Localization
│   └── constants/                   # Constants
├── assets/
│   └── fonts/                       # Custom fonts
├── android/                         # Android configuration
├── ios/                             # iOS configuration
├── web/                             # Web configuration
├── pubspec.yaml                     # Dependencies
└── README.md                        # Documentation
```

## Next Steps

1. **Customize the App**: Modify colors, fonts, and UI in `lib/main.dart`
2. **Add More Languages**: Create new `.arb` files in `lib/l10n/`
3. **Enhance AI Features**: Update `lib/services/chat_service.dart`
4. **Deploy**: Build and publish to app stores

## Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Google Gemini API Docs](https://ai.google.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Dart Language Guide](https://dart.dev/guides)

## Support

If you encounter any issues:

1. Check the Troubleshooting section above
2. Review the error messages in the console
3. Check the [Flutter Issues](https://github.com/flutter/flutter/issues)
4. Contact support at: privacy@flutterchatbot.com

## Security Notes

- Never commit API keys to version control
- Use environment variables for sensitive data
- Keep dependencies updated
- Review privacy policy before deployment
- Test thoroughly before production release

---

**Last Updated**: January 2025
**Version**: 1.0.0
