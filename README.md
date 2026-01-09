# Sayur Segar

A Flutter package containing reusable widgets and utility functions for Lokio.dev projects.

## Features

✨ **UI Components** - Pre-built widgets following Lokio.dev design system  
🔧 **Formatter Utilities** - Comprehensive formatting functions for strings, numbers, dates, and more  
✅ **Well Tested** - 170+ unit tests covering all functionality

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  sayur_segar: ^0.1.2
```

Then run:

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:sayur_segar/sayur_segar.dart';

// Use button components
SayurSegar(
  onPressed: () {},
  variant: ButtonVariant.primary,
  child: Text('Click Me'),
)

// Use formatter utilities
String formatted = formatCurrency(1000000); // 'Rp 1.000.000'
String date = formatDate(DateTime.now(), 'dd/MM/yyyy');
String phone = formatPhoneNumber('081234567890'); // '0812-3456-7890'
```

## Example App

Explore all features with our interactive example app:

```bash
cd example
flutter pub get
flutter run
```

## Documentation

📚 **Full Documentation**: [flutter.lokio.dev](https://flutter.lokio.dev)  
🏠 **Homepage**: [sayursegar.lokio.dev](https://sayursegar.lokio.dev)  
💻 **Repository**: [GitHub](https://github.com/sayur-segar/sayur-segar-for-flutter)

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Made with ❤️ by [Lokio.dev](https://lokio.dev)
