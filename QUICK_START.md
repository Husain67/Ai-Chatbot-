# Quick Start Guide

Get the Flutter AI Chatbot running in 5 minutes!

## Prerequisites

- Flutter SDK installed
- Gemini API key (get from [Google Cloud Console](https://console.cloud.google.com/))

## 5-Minute Setup

### Step 1: Install Dependencies (1 min)
```bash
flutter pub get
```

### Step 2: Download Poppins Font (2 min)
1. Download from [Google Fonts - Poppins](https://fonts.google.com/specimen/Poppins)
2. Extract and copy these files to `assets/fonts/`:
   - `Poppins-Regular.ttf`
   - `Poppins-SemiBold.ttf`
   - `Poppins-Bold.ttf`

### Step 3: Run the App (2 min)
```bash
flutter run --dart-define=GEMINI_API_KEY=your_api_key_here
```

Replace `your_api_key_here` with your actual Gemini API key.

## Done! 🎉

The app should now be running. Try:
- 💬 Send a chat message
- 🎤 Click the microphone for voice input
- 📸 Click the attachment icon to upload an image
- 🌍 Go to menu → Language to change language
- 🎨 Go to menu → Theme to change theme

## Troubleshooting

### Font Error?
```bash
flutter clean
flutter pub get
flutter run --dart-define=GEMINI_API_KEY=your_api_key_here
```

### API Key Error?
- Verify key is correct
- Check API is enabled in Google Cloud Console
- Try creating a new key

### App Won't Start?
```bash
flutter clean
flutter pub get
flutter run -v
```

## Next Steps

- Read [SETUP_GUIDE.md](SETUP_GUIDE.md) for detailed setup
- Read [README.md](README.md) for full documentation
- Check [ISSUES_FIXED.md](ISSUES_FIXED.md) for what was fixed

## Need Help?

- Check [SETUP_GUIDE.md](SETUP_GUIDE.md) Troubleshooting section
- Review error messages in console
- Contact: privacy@flutterchatbot.com

---

**Happy Chatting!** 🚀
