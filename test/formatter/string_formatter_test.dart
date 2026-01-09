import 'package:flutter_test/flutter_test.dart';
import 'package:sayur_segar/src/widgets/utils/formatter.dart';

void main() {
  group('String Formatter Tests', () {
    group('capitalize', () {
      test('should capitalize first letter of lowercase string', () {
        expect(capitalize('hello'), equals('Hello'));
      });

      test('should keep first letter uppercase if already uppercase', () {
        expect(capitalize('HELLO'), equals('HELLO'));
      });

      test('should handle empty string', () {
        expect(capitalize(''), equals(''));
      });

      test('should handle single character', () {
        expect(capitalize('a'), equals('A'));
        expect(capitalize('A'), equals('A'));
      });

      test('should handle string with numbers', () {
        expect(capitalize('123hello'), equals('123hello'));
      });

      test('should handle string with special characters', () {
        expect(capitalize('!hello'), equals('!hello'));
      });
    });

    group('capitalizeWords', () {
      test('should capitalize first letter of each word', () {
        expect(capitalizeWords('hello world'), equals('Hello World'));
      });

      test('should handle uppercase words', () {
        expect(capitalizeWords('HELLO WORLD'), equals('Hello World'));
      });

      test('should handle mixed case words', () {
        expect(capitalizeWords('hELLo WoRLd'), equals('Hello World'));
      });

      test('should handle empty string', () {
        expect(capitalizeWords(''), equals(''));
      });

      test('should handle single word', () {
        expect(capitalizeWords('hello'), equals('Hello'));
      });

      test('should handle multiple spaces', () {
        expect(capitalizeWords('hello   world'), equals('Hello   World'));
      });

      test('should handle string with numbers', () {
        expect(capitalizeWords('hello 123 world'), equals('Hello 123 World'));
      });
    });

    group('truncate', () {
      test('should truncate string longer than maxLength', () {
        expect(truncate('Hello World', 5), equals('Hello...'));
      });

      test('should not truncate string shorter than maxLength', () {
        expect(truncate('Hello', 10), equals('Hello'));
      });

      test('should handle exact length', () {
        expect(truncate('Hello', 5), equals('Hello'));
      });

      test('should use custom ellipsis', () {
        expect(truncate('Hello World', 5, ellipsis: '..'), equals('Hello..'));
      });

      test('should handle empty string', () {
        expect(truncate('', 5), equals(''));
      });

      test('should handle zero maxLength', () {
        expect(truncate('Hello', 0), equals('...'));
      });
    });

    group('slugify', () {
      test('should convert string to slug format', () {
        expect(slugify('Hello World!'), equals('hello-world'));
      });

      test('should handle string with numbers', () {
        expect(slugify('User Name 123'), equals('user-name-123'));
      });

      test('should remove special characters', () {
        expect(slugify('Hello@World#123!'), equals('helloworld123'));
      });

      test('should handle multiple spaces and hyphens', () {
        expect(slugify('Hello   World---Test'), equals('hello-world-test'));
      });

      test('should remove leading and trailing hyphens', () {
        expect(slugify('-Hello World-'), equals('hello-world'));
      });

      test('should handle empty string', () {
        expect(slugify(''), equals(''));
      });

      test('should handle string with only special characters', () {
        expect(slugify('!!!@@@###'), equals(''));
      });
    });

    group('removeWhitespace', () {
      test('should remove all whitespace from string', () {
        expect(removeWhitespace('Hello World'), equals('HelloWorld'));
      });

      test('should handle multiple spaces', () {
        expect(removeWhitespace('Hello   World'), equals('HelloWorld'));
      });

      test('should handle tabs and newlines', () {
        expect(removeWhitespace('Hello\tWorld\nTest'), equals('HelloWorldTest'));
      });

      test('should handle empty string', () {
        expect(removeWhitespace(''), equals(''));
      });

      test('should handle string with only whitespace', () {
        expect(removeWhitespace('   '), equals(''));
      });
    });

    group('removeSpecialCharacters', () {
      test('should remove special characters without keeping spaces', () {
        expect(
          removeSpecialCharacters('Hello@World#123!'),
          equals('HelloWorld123'),
        );
      });

      test('should remove special characters while keeping spaces', () {
        expect(
          removeSpecialCharacters('Hello@World#123!', keepSpaces: true),
          equals('HelloWorld123'),
        );
      });

      test('should handle empty string', () {
        expect(removeSpecialCharacters(''), equals(''));
      });

      test('should handle string with only special characters', () {
        expect(removeSpecialCharacters('!!!@@@###'), equals(''));
      });

      test('should preserve alphanumeric characters', () {
        expect(
          removeSpecialCharacters('Hello123World'),
          equals('Hello123World'),
        );
      });
    });

    group('formatInitials', () {
      test('should format initials from full name', () {
        expect(formatInitials('John Doe'), equals('JD'));
      });

      test('should handle three names with maxLength', () {
        expect(formatInitials('John Michael Doe', maxLength: 3), equals('JMD'));
      });

      test('should limit to maxLength', () {
        expect(formatInitials('John Michael Doe', maxLength: 2), equals('JM'));
      });

      test('should handle single name', () {
        expect(formatInitials('John'), equals('J'));
      });

      test('should handle empty string', () {
        expect(() => formatInitials(''), throwsA(isA<RangeError>()));
      });

      test('should handle multiple spaces', () {
        expect(formatInitials('John   Doe'), equals('JD'));
      });

      test('should handle name with special characters', () {
        expect(formatInitials('John-Doe'), equals('J'));
      });
    });

    group('toTitleCase', () {
      test('should convert string to title case', () {
        expect(toTitleCase('hello world'), equals('Hello World'));
      });

      test('should handle uppercase string', () {
        expect(toTitleCase('HELLO WORLD'), equals('Hello World'));
      });

      test('should handle mixed case string', () {
        expect(toTitleCase('hELLo WoRLd'), equals('Hello World'));
      });

      test('should handle empty string', () {
        expect(toTitleCase(''), equals(''));
      });

      test('should handle single word', () {
        expect(toTitleCase('hello'), equals('Hello'));
      });
    });
  });
}

