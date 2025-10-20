# Flutter AI Chatbot

A feature-rich Flutter chatbot application powered by Google Gemini AI with multi-language support, voice input/output, image analysis, and theme customization.

## Features

- 🤖 **AI-Powered Chat**: Real-time conversations with Google Gemini AI
- 🖼️ **Image Analysis**: Upload and analyze images with AI
- 🎤 **Voice Support**: Voice input (speech-to-text) and voice output (text-to-speech)
- 🌍 **Multi-Language**: Support for 20+ languages including English, Hindi, Spanish, French, German, and more
- 🎨 **Theme Support**: Light, Dark, and System theme modes
- 📑 **Chat Tabs**: Organize conversations in multiple tabs
- 💾 **Chat History**: Persistent storage of all conversations
- 🔒 **Privacy-Focused**: Local data storage with no permanent server storage
- 📱 **Cross-Platform**: Works on Android, iOS, Web, and macOS

## Project Structure

```
lib/
├── main.dart                 # App entry point with theme and locale providers
├── screens/                  # UI screens
│   ├── chat_screen.dart     # Main chat interface
│   ├── about_screen.dart    # About page
��   ├── privacy_policy_screen.dart  # Privacy policy
│   ├── language_selection_screen.dart  # Language selection
│   └── chat_history_screen.dart  # Chat history management
├── services/                # Business logic
│   ├── chat_service.dart    # AI chat and message handling
│   ├── tab_service.dart     # Tab management and persistence
│   └── ai_service.dart      # Placeholder for future AI features
├── models/                  # Data models
│   ├── chat_message.dart    # Message model
│   └── chat_tab.dart        # Tab model
├── widgets/                 # Reusable UI components
│   ├── chat_bubble.dart     # Message display
│   ├── input_area.dart      # Message input with voice/image
│   └── tab_bar.dart         # Tab navigation
├── l10n/                    # Localization files
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   └── app_localizations_hi.dart
└── constants/               # App constants

assets/
└── fonts/                   # Custom fonts (Poppins)
```

## Getting Started

### Prerequisites

- Flutter SDK (3.9.0 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Google Gemini API Key

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd myapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Download Poppins Font** (Required for custom typography)
   - Download Poppins font files from [Google Fonts](https://fonts.google.com/specimen/Poppins)
   - Place the following files in `assets/fonts/`:
     - `Poppins-Regular.ttf`
     - `Poppins-SemiBold.ttf`
     - `Poppins-Bold.ttf`

4. **Configure Gemini API Key**
   - Get your API key from [Google Cloud Console](https://console.cloud.google.com/apis/credentials)
   - Set the environment variable or update `lib/services/chat_service.dart`:
     ```bash
     flutter run --dart-define=GEMINI_API_KEY=your_api_key_here
     ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Configuration

### Firebase Setup

The app uses Firebase for backend services. Firebase configuration is already set up in `lib/firebase_options.dart` for:
- Web
- Android
- iOS
- macOS

If you need to update Firebase configuration:
```bash
flutterfire configure
```

### Supported Languages

The app supports the following languages:
- English (en)
- Hindi (hi)
- Spanish (es)
- French (fr)
- German (de)
- Italian (it)
- Portuguese (pt)
- Russian (ru)
- Japanese (ja)
- Korean (ko)
- Chinese (zh)
- Arabic (ar)
- Bengali (bn)
- Urdu (ur)
- Persian (fa)
- Turkish (tr)
- Vietnamese (vi)
- Thai (th)
- Dutch (nl)
- Swedish (sv)

To add more languages, create corresponding `.arb` files in `lib/l10n/` and update `app_localizations.dart`.

## Key Dependencies

- **firebase_core**: Firebase initialization
- **provider**: State management
- **google_generative_ai**: Gemini AI integration
- **speech_to_text**: Voice input
- **flutter_tts**: Text-to-speech
- **shared_preferences**: Local data persistence
- **image_picker**: Image selection
- **connectivity_plus**: Network connectivity check
- **intl**: Internationalization support

## Architecture

### State Management
The app uses Provider for state management with three main providers:
- `ThemeProvider`: Manages theme mode (light/dark/system)
- `LocaleProvider`: Manages app language
- `ChatService`: Handles AI chat and message logic
- `TabService`: Manages chat tabs and persistence

### Data Persistence
- Chat history and tabs are stored locally using `SharedPreferences`
- No data is permanently stored on servers
- Users can delete their conversation history anytime

### AI Integration
- Uses Google Gemini 1.5 Flash model for fast responses
- Supports both text and image analysis
- Includes network connectivity checks before API calls

## Troubleshooting

### Font Loading Issues
If you encounter font loading errors:
1. Ensure Poppins font files are in `assets/fonts/`
2. Run `flutter clean` and `flutter pub get`
3. Rebuild the app

### API Key Issues
- Verify your Gemini API key is valid
- Check that the API is enabled in Google Cloud Console
- Ensure the key has appropriate permissions

### Voice Input Not Working
- Check microphone permissions on your device
- Ensure internet connection for speech recognition
- Verify `speech_to_text` package is properly initialized

### Chat History Not Persisting
- Check that `SharedPreferences` has write permissions
- Verify app storage permissions on the device
- Clear app cache and try again

## Development

### Running Tests
```bash
flutter test
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## Privacy & Security

- All conversations are processed in real-time
- Images are temporarily stored for analysis only
- No permanent data storage on servers
- Uses industry-standard encryption
- Complies with privacy regulations

See `Privacy Policy` in the app for detailed information.

## Contributing

Contributions are welcome! Please follow these guidelines:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Contact: privacy@flutterchatbot.com

## Acknowledgments

- Google Gemini AI for AI capabilities
- Flutter team for the amazing framework
- Firebase for backend services
- All open-source contributors

---

**Last Updated**: January 2025
**Version**: 1.0.0
