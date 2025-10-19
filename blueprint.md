# Project Blueprint

## Overview

This is a Flutter-based chatbot application that uses Firebase for its backend services. The application features a chat interface and uses the `google_fonts` package for custom typography.

## Current State

The project is currently experiencing a runtime error on the Android emulator. The application is unable to load the "Poppins" font from Google Fonts, resulting in a `Failed host lookup` error. This is due to a DNS issue within the emulator's network configuration.

## Plan

To resolve the font loading issue, I will bundle the "Poppins" font directly into the application. This will eliminate the need for a network connection to load the font and ensure that it is always available.

### Steps:

1.  **Download Font Files:**
    *   Download the "Poppins" font in the following weights: Bold, Semi-bold, and Regular.
2.  **Create Asset Directory:**
    *   Create a new directory at `assets/fonts`.
3.  **Add Font Files:**
    *   Place the downloaded font files into the `assets/fonts` directory.
4.  **Update `pubspec.yaml`:**
    *   Declare the new font files in the `flutter` section of the `pubspec.yaml` file.
5.  **Update `lib/main.dart`:**
    *   Modify the `ThemeData` to load the "Poppins" font from the application's assets instead of from the `google_fonts` package.
