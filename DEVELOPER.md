# Developer Documentation

This document is for developers who want to contribute to or understand the internals of the Sayur Segar package.

## 📋 Table of Contents

- [Project Structure](#project-structure)
- [Development Setup](#development-setup)
- [Code Organization](#code-organization)
- [Testing](#testing)
- [Adding New Features](#adding-new-features)
- [Publishing](#publishing)

## 📁 Project Structure

```
sayur_segar/
├── lib/
│   ├── sayur_segar.dart          # Main export file
│   └── src/
│       ├── config/
│       │   └── theme.dart  # Theme configuration
│       └── widgets/
│           ├── button/
│           │   ├── main.dart     # SayurSegar widget
│           │   └── types.dart   # Button enums and config
│           └── utils/
│               └── formatter.dart # All formatter utilities
├── test/
│   └── formatter/                # Unit tests (organized by category)
│       ├── string_formatter_test.dart
│       ├── case_converter_test.dart
│       ├── number_formatter_test.dart
│       ├── date_time_formatter_test.dart
│       └── special_formatter_test.dart
├── example/                       # Example app (Storybook manual)
│   ├── lib/
│   │   └── main.dart
│   └── pubspec.yaml
└── pubspec.yaml
```

## 🛠️ Development Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/sayur-segar/sayur-segar-for-flutter.git
   cd sayur-segar-for-flutter
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run tests**:
   ```bash
   flutter test
   ```

4. **Run example app**:
   ```bash
   cd example
   flutter pub get
   flutter run
   ```

## 📦 Code Organization

### Widgets

All UI components are located in `lib/src/widgets/`:
- **Button**: `lib/src/widgets/button/`
  - `main.dart` - SayurSegar widget implementation
  - `types.dart` - ButtonVariant, ButtonSize enums and ButtonConfig

### Utilities

All utility functions are in `lib/src/widgets/utils/`:
- **Formatter**: `lib/src/widgets/utils/formatter.dart`
  - String formatters
  - Number formatters
  - Date & time formatters
  - Case converters
  - Special formatters

### Configuration

Theme and configuration:
- **Theme**: `lib/src/config/theme.dart`

### Exports

Main export file (`lib/sayur_segar.dart`) exports all public APIs:
```dart
export 'src/widgets/button/main.dart';
export 'src/widgets/button/types.dart';
export 'src/widgets/utils/formatter.dart';
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/formatter/string_formatter_test.dart

# Run with coverage
flutter test --coverage
```

### Test Organization

Tests are organized by category in `test/formatter/`:
- `string_formatter_test.dart` - String manipulation functions
- `case_converter_test.dart` - Case conversion functions
- `number_formatter_test.dart` - Number formatting functions
- `date_time_formatter_test.dart` - Date and time functions
- `special_formatter_test.dart` - Special formatting functions

### Writing Tests

Follow these guidelines:
- One test file per category
- Group related tests using `group()`
- Test edge cases (empty strings, null values, boundary conditions)
- Use descriptive test names
- Aim for high coverage

Example:
```dart
group('capitalize', () {
  test('should capitalize first letter of lowercase string', () {
    expect(capitalize('hello'), equals('Hello'));
  });
  
  test('should handle empty string', () {
    expect(capitalize(''), equals(''));
  });
});
```

## ➕ Adding New Features

### Adding a New Formatter Function

1. **Add the function** to `lib/src/widgets/utils/formatter.dart`:
   ```dart
   /// Formats a string in a specific way.
   ///
   /// Example:
   /// ```dart
   /// formatSomething('input') // Returns 'output'
   /// ```
   String formatSomething(String input) {
     // Implementation
   }
   ```

2. **Add tests** to the appropriate test file:
   ```dart
   group('formatSomething', () {
     test('should format correctly', () {
       expect(formatSomething('input'), equals('output'));
     });
   });
   ```

3. **Update example app** in `example/lib/main.dart` to showcase the new function

4. **Update README.md** if it's a user-facing feature

### Adding a New Widget

1. **Create widget file** in `lib/src/widgets/[widget_name]/`
2. **Add exports** to `lib/sayur_segar.dart`
3. **Add tests** in `test/`
4. **Add examples** to example app
5. **Update documentation**

## 📤 Publishing

### Pre-Publish Checklist

- [ ] All tests pass
- [ ] Example app runs without errors
- [ ] README.md is updated
- [ ] CHANGELOG.md is updated
- [ ] Version is bumped in `pubspec.yaml`
- [ ] No linter errors
- [ ] All files are committed

### Publishing Steps

1. **Update version** in `pubspec.yaml`
2. **Update CHANGELOG.md**
3. **Run dry-run**:
   ```bash
   make publish-dry-run
   # or
   flutter pub publish --dry-run
   ```

4. **Publish**:
   ```bash
   make publish
   # or
   flutter pub publish
   ```

## 📝 Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check for issues
- Follow existing code patterns
- Add documentation comments for public APIs
- Use meaningful variable and function names

## 🔍 Linting

The project uses `flutter_lints` for code quality:

```bash
# Analyze code
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

## 📚 Additional Resources

- **User Documentation**: [flutter.lokio.dev](https://flutter.lokio.dev)
- **Package Homepage**: [flutter.lokio.dev](https://flutter.lokio.dev)
- **Repository**: [GitHub](https://github.com/sayur-segar/sayur-segar-for-flutter)
- [Flutter Package Guide](https://flutter.dev/to/develop-packages)
- [Dart Package Guide](https://dart.dev/guides/libraries/create-packages)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add tests for new features
5. Ensure all tests pass
6. Update documentation
7. Commit your changes (`git commit -m 'Add amazing feature'`)
8. Push to the branch (`git push origin feature/amazing-feature`)
9. Open a Pull Request

## 📞 Support

For questions or issues:
- Open an issue on [GitHub](https://github.com/sayur-segar/sayur-segar-for-flutter/issues)
- Check the [documentation](https://flutter.lokio.dev)

---

Happy coding! 🚀

