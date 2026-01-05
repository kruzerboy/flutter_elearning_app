import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.menu_book,
            size: 60,
            color: Color(0xFF0000FF),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Simple',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Text(
          'edu',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ==================== FILE: lib/widgets/back_button_widget.dart ====================


// ==================== FILE: lib/widgets/learning_illustration.dart ====================


// ==================== FILE: lib/widgets/custom_text_field.dart ====================

// ==================== FILE: lib/widgets/password_text_field.dart ====================


// ==================== FILE: lib/widgets/remember_me_checkbox.dart ====================


// ==================== FILE: lib/widgets/terms_checkbox.dart ====================


// ==================== FILE: lib/widgets/primary_button.dart ====================

// ==================== FILE: lib/widgets/or_divider.dart ====================

// ==================== FILE: lib/widgets/google_signin_button.dart ====================


// ==================== PROJECT STRUCTURE ====================
/*
lib/
├── main.dart
├── screens/
│   ├── splash_screen.dart
│   ├── login_screen.dart
│   └── signup_screen.dart
└── widgets/
    ├── app_logo.dart
    ├── back_button_widget.dart
    ├── learning_illustration.dart
    ├── custom_text_field.dart
    ├── password_text_field.dart
    ├── remember_me_checkbox.dart
    ├── terms_checkbox.dart
    ├── primary_button.dart
    ├── or_divider.dart
    └── google_signin_button.dart
*/