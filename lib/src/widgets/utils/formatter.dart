/// A collection of utility functions for formatting strings, numbers, dates, and more.
/// This library provides reusable formatters for Sayur Segar applications.
library;

/// Capitalizes the first letter of a string.
///
/// Example:
/// ```dart
/// capitalize('hello') // Returns 'Hello'
/// capitalize('HELLO') // Returns 'HELLO'
/// ```
String capitalize(String value) {
  if (value.isEmpty) return value;
  return value[0].toUpperCase() + value.substring(1);
}

/// Capitalizes the first letter of each word in a string.
///
/// Example:
/// ```dart
/// capitalizeWords('hello world') // Returns 'Hello World'
/// capitalizeWords('hello WORLD') // Returns 'Hello World'
/// ```
String capitalizeWords(String value) {
  if (value.isEmpty) return value;
  return value
      .split(' ')
      .map(
        (word) => word.isEmpty
            ? word
            : word[0].toUpperCase() + word.substring(1).toLowerCase(),
      )
      .join(' ');
}

/// Formats a number with thousand separators.
///
/// [value] - The number to format
/// [separator] - The separator character (default: ',')
/// [decimalPlaces] - Number of decimal places (default: 0)
///
/// Example:
/// ```dart
/// formatNumber(1000) // Returns '1,000'
/// formatNumber(1234.56, decimalPlaces: 2) // Returns '1,234.56'
/// ```
String formatNumber(
  num value, {
  String separator = ',',
  int decimalPlaces = 0,
}) {
  final parts = value.toString().split('.');
  final integerPart = parts[0];
  final decimalPart = parts.length > 1 ? parts[1] : '';

  String formattedInteger = '';
  int count = 0;
  for (int i = integerPart.length - 1; i >= 0; i--) {
    if (count == 3) {
      formattedInteger = separator + formattedInteger;
      count = 0;
    }
    formattedInteger = integerPart[i] + formattedInteger;
    count++;
  }

  if (decimalPlaces > 0) {
    String formattedDecimal = decimalPart;
    if (formattedDecimal.length > decimalPlaces) {
      formattedDecimal = formattedDecimal.substring(0, decimalPlaces);
    } else {
      formattedDecimal = formattedDecimal.padRight(decimalPlaces, '0');
    }
    return '$formattedInteger.$formattedDecimal';
  }

  return formattedInteger;
}

/// Formats a number as currency.
///
/// [value] - The amount to format
/// [symbol] - The currency symbol (default: 'Rp')
/// [separator] - The thousand separator (default: '.')
/// [decimalSeparator] - The decimal separator (default: ',')
/// [decimalPlaces] - Number of decimal places (default: 0)
///
/// Example:
/// ```dart
/// formatCurrency(1000000) // Returns 'Rp 1.000.000'
/// formatCurrency(1234.56, symbol: '\$', separator: ',', decimalPlaces: 2) // Returns '\$ 1,234.56'
/// ```
String formatCurrency(
  num value, {
  String symbol = 'Rp',
  String separator = '.',
  String decimalSeparator = ',',
  int decimalPlaces = 0,
}) {
  final parts = value.toString().split('.');
  final integerPart = parts[0];
  final decimalPart = parts.length > 1 ? parts[1] : '';

  String formattedInteger = '';
  int count = 0;
  for (int i = integerPart.length - 1; i >= 0; i--) {
    if (count == 3) {
      formattedInteger = separator + formattedInteger;
      count = 0;
    }
    formattedInteger = integerPart[i] + formattedInteger;
    count++;
  }

  if (decimalPlaces > 0) {
    String formattedDecimal = decimalPart;
    if (formattedDecimal.length > decimalPlaces) {
      formattedDecimal = formattedDecimal.substring(0, decimalPlaces);
    } else {
      formattedDecimal = formattedDecimal.padRight(decimalPlaces, '0');
    }
    return '$symbol $formattedInteger$decimalSeparator$formattedDecimal';
  }

  return '$symbol $formattedInteger';
}

/// Formats a phone number with a specific pattern.
///
/// [phone] - The phone number string
/// [pattern] - The format pattern (default: 'XXX-XXXX-XXXX')
///   Use 'X' for digits, other characters will be preserved
///
/// Example:
/// ```dart
/// formatPhoneNumber('081234567890') // Returns '0812-3456-7890'
/// formatPhoneNumber('081234567890', pattern: '(XXX) XXX-XXXX') // Returns '(081) 234-5678'
/// ```
String formatPhoneNumber(String phone, {String pattern = 'XXXX-XXXX-XXXX'}) {
  final digits = phone.replaceAll(RegExp(r'[^\d]'), '');
  if (digits.isEmpty) return phone;

  String result = pattern;
  int digitIndex = 0;

  for (int i = 0; i < result.length && digitIndex < digits.length; i++) {
    if (result[i] == 'X') {
      result =
          result.substring(0, i) + digits[digitIndex] + result.substring(i + 1);
      digitIndex++;
    }
  }

  return result;
}

/// Formats a date string.
///
/// [date] - The DateTime object to format
/// [format] - The format pattern
///   Available patterns:
///   - 'dd' - Day (01-31)
///   - 'MM' - Month (01-12)
///   - 'yyyy' - Year (4 digits)
///   - 'HH' - Hour 24h (00-23)
///   - 'mm' - Minute (00-59)
///   - 'ss' - Second (00-59)
///
/// Example:
/// ```dart
/// formatDate(DateTime(2024, 1, 15), 'dd/MM/yyyy') // Returns '15/01/2024'
/// formatDate(DateTime(2024, 1, 15), 'dd MMMM yyyy') // Returns '15 January 2024'
/// ```
String formatDate(DateTime date, String format) {
  String result = format;

  // Day
  result = result.replaceAll('dd', date.day.toString().padLeft(2, '0'));
  result = result.replaceAll('d', date.day.toString());

  // Month
  result = result.replaceAll('MM', date.month.toString().padLeft(2, '0'));
  result = result.replaceAll('M', date.month.toString());

  // Year
  result = result.replaceAll('yyyy', date.year.toString());
  result = result.replaceAll('yy', date.year.toString().substring(2));

  // Hour
  result = result.replaceAll('HH', date.hour.toString().padLeft(2, '0'));
  result = result.replaceAll('H', date.hour.toString());
  result = result.replaceAll('hh', (date.hour % 12).toString().padLeft(2, '0'));
  result = result.replaceAll('h', (date.hour % 12).toString());

  // Minute
  result = result.replaceAll('mm', date.minute.toString().padLeft(2, '0'));
  result = result.replaceAll('m', date.minute.toString());

  // Second
  result = result.replaceAll('ss', date.second.toString().padLeft(2, '0'));
  result = result.replaceAll('s', date.second.toString());

  // Month names
  const monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  const monthNamesShort = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  result = result.replaceAll('MMMM', monthNames[date.month - 1]);
  result = result.replaceAll('MMM', monthNamesShort[date.month - 1]);

  // Day names
  const dayNames = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  const dayNamesShort = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  final dayIndex = (date.weekday - 1) % 7;
  result = result.replaceAll('DDDD', dayNames[dayIndex]);
  result = result.replaceAll('DDD', dayNamesShort[dayIndex]);

  return result;
}

/// Formats a relative time (e.g., "2 hours ago", "3 days ago").
///
/// [date] - The DateTime to compare
/// [now] - The current DateTime (default: DateTime.now())
///
/// Example:
/// ```dart
/// formatRelativeTime(DateTime.now().subtract(Duration(hours: 2))) // Returns '2 hours ago'
/// ```
String formatRelativeTime(DateTime date, {DateTime? now}) {
  final current = now ?? DateTime.now();
  final difference = current.difference(date);

  if (difference.inDays > 365) {
    final years = (difference.inDays / 365).floor();
    return '$years ${years == 1 ? 'year' : 'years'} ago';
  } else if (difference.inDays > 30) {
    final months = (difference.inDays / 30).floor();
    return '$months ${months == 1 ? 'month' : 'months'} ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
  } else {
    return 'just now';
  }
}

/// Truncates a string to a maximum length with an ellipsis.
///
/// [value] - The string to truncate
/// [maxLength] - Maximum length before truncation
/// [ellipsis] - The ellipsis string (default: '...')
///
/// Example:
/// ```dart
/// truncate('Hello World', 5) // Returns 'Hello...'
/// ```
String truncate(String value, int maxLength, {String ellipsis = '...'}) {
  if (value.length <= maxLength) return value;
  return value.substring(0, maxLength) + ellipsis;
}

/// Converts a string to slug format (lowercase, hyphen-separated).
///
/// Example:
/// ```dart
/// slugify('Hello World!') // Returns 'hello-world'
/// slugify('User Name 123') // Returns 'user-name-123'
/// ```
String slugify(String value) {
  return value
      .toLowerCase()
      .replaceAll(RegExp(r'[^\w\s-]'), '')
      .replaceAll(RegExp(r'[-\s]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
}

/// Converts a string to camelCase.
///
/// Example:
/// ```dart
/// toCamelCase('hello world') // Returns 'helloWorld'
/// toCamelCase('hello-world') // Returns 'helloWorld'
/// ```
String toCamelCase(String value) {
  final words = value
      .toLowerCase()
      .replaceAll(RegExp(r'[^\w\s]'), ' ')
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .toList();

  if (words.isEmpty) return '';

  String result = words[0];
  for (int i = 1; i < words.length; i++) {
    result += capitalize(words[i]);
  }
  return result;
}

/// Converts a string to snake_case.
///
/// Example:
/// ```dart
/// toSnakeCase('Hello World') // Returns 'hello_world'
/// toSnakeCase('helloWorld') // Returns 'hello_world'
/// ```
String toSnakeCase(String value) {
  return value
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      )
      .replaceAll(RegExp(r'[^\w]'), '_')
      .replaceAll(RegExp(r'_+'), '_')
      .replaceAll(RegExp(r'^_|_$'), '')
      .toLowerCase();
}

/// Converts a string to kebab-case.
///
/// Example:
/// ```dart
/// toKebabCase('Hello World') // Returns 'hello-world'
/// toKebabCase('helloWorld') // Returns 'hello-world'
/// ```
String toKebabCase(String value) {
  return value
      .replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => '-${match.group(0)!.toLowerCase()}',
      )
      .replaceAll(RegExp(r'[^\w]'), '-')
      .replaceAll(RegExp(r'-+'), '-')
      .replaceAll(RegExp(r'^-|-$'), '')
      .toLowerCase();
}

/// Formats file size in bytes to human-readable format.
///
/// [bytes] - The size in bytes
/// [decimals] - Number of decimal places (default: 2)
///
/// Example:
/// ```dart
/// formatBytes(1024) // Returns '1 KB'
/// formatBytes(1048576) // Returns '1 MB'
/// ```
String formatBytes(int bytes, {int decimals = 2}) {
  if (bytes < 0) throw ArgumentError('Bytes cannot be negative');
  if (bytes == 0) return '0 B';

  const k = 1024;
  const sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
  final i = (bytes / k).floor().toString().length - 1;
  final sizeIndex = i.clamp(0, sizes.length - 1);

  return '${(bytes / (k * sizeIndex)).toStringAsFixed(decimals)} ${sizes[sizeIndex]}';
}

/// Formats a percentage value.
///
/// [value] - The percentage value (0-100)
/// [decimals] - Number of decimal places (default: 1)
/// [showSymbol] - Whether to show the % symbol (default: true)
///
/// Example:
/// ```dart
/// formatPercentage(45.678) // Returns '45.7%'
/// formatPercentage(45.678, decimals: 0) // Returns '46%'
/// ```
String formatPercentage(
  double value, {
  int decimals = 1,
  bool showSymbol = true,
}) {
  final formatted = value.toStringAsFixed(decimals);
  return showSymbol ? '$formatted%' : formatted;
}

/// Removes special characters from a string, keeping only alphanumeric and spaces.
///
/// [value] - The string to clean
/// [keepSpaces] - Whether to keep spaces (default: true)
///
/// Example:
/// ```dart
/// removeSpecialCharacters('Hello@World#123!') // Returns 'HelloWorld123'
/// removeSpecialCharacters('Hello@World#123!', keepSpaces: true) // Returns 'Hello World 123'
/// ```
String removeSpecialCharacters(String value, {bool keepSpaces = false}) {
  if (keepSpaces) {
    return value.replaceAll(RegExp(r'[^\w\s]'), '');
  }
  return value.replaceAll(RegExp(r'[^\w]'), '');
}

/// Formats initials from a name (first letter of each word).
///
/// [name] - The full name
/// [maxLength] - Maximum number of initials (default: 2)
///
/// Example:
/// ```dart
/// formatInitials('John Doe') // Returns 'JD'
/// formatInitials('John Michael Doe', maxLength: 3) // Returns 'JMD'
/// ```
String formatInitials(String name, {int maxLength = 2}) {
  final words = name.trim().split(RegExp(r'\s+'));
  if (words.isEmpty) return '';

  final initials = words
      .take(maxLength)
      .map((word) => word.isNotEmpty ? word[0].toUpperCase() : '')
      .where((initial) => initial.isNotEmpty)
      .join();

  return initials.isEmpty ? name[0].toUpperCase() : initials;
}

/// Masks sensitive information (e.g., email, phone number).
///
/// [value] - The value to mask
/// [maskChar] - The character to use for masking (default: '*')
/// [visibleStart] - Number of characters to show at the start (default: 2)
/// [visibleEnd] - Number of characters to show at the end (default: 2)
///
/// Example:
/// ```dart
/// mask('john.doe@example.com') // Returns 'jo**************om'
/// mask('081234567890', visibleStart: 4, visibleEnd: 4) // Returns '0812****7890'
/// ```
String mask(
  String value, {
  String maskChar = '*',
  int visibleStart = 2,
  int visibleEnd = 2,
}) {
  if (value.length <= visibleStart + visibleEnd) {
    return maskChar * value.length;
  }

  final start = value.substring(0, visibleStart);
  final end = value.substring(value.length - visibleEnd);
  final masked = maskChar * (value.length - visibleStart - visibleEnd);

  return '$start$masked$end';
}

/// Formats a duration in human-readable format.
///
/// [duration] - The Duration object
/// [showSeconds] - Whether to show seconds (default: true)
///
/// Example:
/// ```dart
/// formatDuration(Duration(hours: 2, minutes: 30, seconds: 45)) // Returns '2h 30m 45s'
/// formatDuration(Duration(minutes: 90)) // Returns '1h 30m'
/// ```
String formatDuration(Duration duration, {bool showSeconds = true}) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  final parts = <String>[];

  if (hours > 0) {
    parts.add('${hours}h');
  }
  if (minutes > 0) {
    parts.add('${minutes}m');
  }
  if (showSeconds && seconds > 0) {
    parts.add('${seconds}s');
  }

  return parts.isEmpty ? '0s' : parts.join(' ');
}

/// Formats a credit card number with spaces.
///
/// [cardNumber] - The credit card number (digits only)
/// [spaces] - Positions where to insert spaces (default: every 4 digits)
///
/// Example:
/// ```dart
/// formatCreditCard('1234567890123456') // Returns '1234 5678 9012 3456'
/// ```
String formatCreditCard(String cardNumber, {int spaces = 4}) {
  final digits = cardNumber.replaceAll(RegExp(r'[^\d]'), '');
  if (digits.isEmpty) return cardNumber;

  final buffer = StringBuffer();
  for (int i = 0; i < digits.length; i++) {
    if (i > 0 && i % spaces == 0) {
      buffer.write(' ');
    }
    buffer.write(digits[i]);
  }
  return buffer.toString();
}

/// Formats a string to title case (capitalize first letter of each word).
///
/// Example:
/// ```dart
/// toTitleCase('hello world') // Returns 'Hello World'
/// toTitleCase('HELLO WORLD') // Returns 'Hello World'
/// ```
String toTitleCase(String value) {
  return capitalizeWords(value);
}

/// Removes all whitespace from a string.
///
/// Example:
/// ```dart
/// removeWhitespace('Hello World') // Returns 'HelloWorld'
/// ```
String removeWhitespace(String value) {
  return value.replaceAll(RegExp(r'\s+'), '');
}

/// Formats a number with leading zeros.
///
/// [value] - The number to format
/// [width] - The minimum width (default: 2)
///
/// Example:
/// ```dart
/// padNumber(5, width: 3) // Returns '005'
/// padNumber(123, width: 2) // Returns '123'
/// ```
String padNumber(int value, {int width = 2}) {
  return value.toString().padLeft(width, '0');
}
