# Flutter E-Learning App

A new Flutter project designed to provide an e-learning platform.

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Any IDE with Flutter support (e.g., Android Studio, VS Code)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/flutter_elearning_app.git
   cd flutter_elearning_app
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

### Project Structure

- `lib/`: Contains the main code for the Flutter application.
  - `widgets/`: Custom widgets used in the app.
  - `presentations/screens/`: Different screens of the app.
  - `data/`: Data models and sample data.

### Key Features

- **Course Tile Widget:**
  Displays course information including title, instructor, rating, and price.
  ```dart:lib/widgets/course_tile.dart
  startLine: 5
  endLine: 118
  ```

- **Home Page:**
  The main screen of the app displaying various courses and categories.
  ```dart:lib/presentations/screens/home_page.dart
  startLine: 15
  endLine: 116
  ```

### Dependencies

- `flutter`
- `cupertino_icons`
- `pinput`
- `flutter_svg`
- `iconly`

For a complete list of dependencies, refer to the `pubspec.yaml` file.
```yaml:pubspec.yaml
startLine: 29
endLine: 39
```

### Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any enhancements or bug fixes.

### License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

### Acknowledgements

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)

For more information, refer to the [Flutter documentation](https://docs.flutter.dev/).