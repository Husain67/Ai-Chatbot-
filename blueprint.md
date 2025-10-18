# Project Blueprint

## Overview

This is a Flutter application that provides a simple chatbot interface. The chatbot is powered by Google's Gemini model through the `firebase_ai` package.

## Style, Design, and Features

### Initial Version (v1.0)

*   **Chat Interface:** A clean and modern chat interface built with the `flutter_chat_ui` package.
*   **Theming:**
    *   Uses Material 3 design principles (`useMaterial3: true`).
    *   A color scheme generated from a seed color (`Colors.deepPurple`).
    *   Custom typography using the `google_fonts` package (`Oswald` for display, `Roboto` for title, `Open Sans` for body).
    *   Support for both light and dark themes.
    *   A theme toggle in the app bar.
*   **State Management:** Uses the `provider` package for managing the theme.
*   **Generative AI:**
    *   Integrates with Firebase AI to use the Gemini model for chat responses.
    *   Handles sending user messages and displaying the model's response.

## Current Plan

### Create a Simple Chatbot App

1.  **Add Dependencies:** Add `firebase_core`, `firebase_ai`, `provider`, `flutter_chat_ui`, `flutter_chat_types`, `google_fonts`, and `uuid` to `pubspec.yaml`.
2.  **Initialize Firebase:** Ensure Firebase is initialized in `lib/main.dart`.
3.  **Implement UI:** Create a chat interface using `flutter_chat_ui`.
4.  **Implement Chat Logic:**
    *   Create a message list to hold the conversation.
    *   Implement a function to send the user's message to the Gemini model using `firebase_ai`.
    *   Display the model's response in the chat UI.
5.  **Theming and Styling:** Apply a Material 3 theme with custom fonts and colors.
6.  **State Management:** Use a `ChangeNotifier` to manage the theme.
