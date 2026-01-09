import 'package:flutter_test/flutter_test.dart';
import 'package:sayur_segar/src/widgets/utils/formatter.dart';

void main() {
  group('Case Converter Tests', () {
    group('toCamelCase', () {
      test('should convert space-separated words to camelCase', () {
        expect(toCamelCase('hello world'), equals('helloWorld'));
      });

      test('should convert hyphen-separated words to camelCase', () {
        expect(toCamelCase('hello-world'), equals('helloWorld'));
      });

      test('should convert underscore-separated words to camelCase', () {
        expect(toCamelCase('hello_world'), equals('hello_world'));
      });

      test('should handle single word', () {
        expect(toCamelCase('hello'), equals('hello'));
      });

      test('should handle uppercase words', () {
        expect(toCamelCase('HELLO WORLD'), equals('helloWorld'));
      });

      test('should remove special characters', () {
        expect(toCamelCase('hello@world#test'), equals('helloWorldTest'));
      });

      test('should handle empty string', () {
        expect(toCamelCase(''), equals(''));
      });

      test('should handle multiple spaces', () {
        expect(toCamelCase('hello   world'), equals('helloWorld'));
      });

      test('should handle string with numbers', () {
        expect(toCamelCase('hello world 123'), equals('helloWorld123'));
      });
    });

    group('toSnakeCase', () {
      test('should convert space-separated words to snake_case', () {
        expect(toSnakeCase('Hello World'), equals('hello_world'));
      });

      test('should convert camelCase to snake_case', () {
        expect(toSnakeCase('helloWorld'), equals('hello_world'));
      });

      test('should convert PascalCase to snake_case', () {
        expect(toSnakeCase('HelloWorld'), equals('hello_world'));
      });

      test('should handle single word', () {
        expect(toSnakeCase('hello'), equals('hello'));
      });

      test('should handle multiple consecutive underscores', () {
        expect(toSnakeCase('Hello__World'), equals('hello_world'));
      });

      test('should remove leading and trailing underscores', () {
        expect(toSnakeCase('_Hello_World_'), equals('hello_world'));
      });

      test('should handle special characters', () {
        expect(toSnakeCase('Hello@World#Test'), equals('hello_world_test'));
      });

      test('should handle empty string', () {
        expect(toSnakeCase(''), equals(''));
      });

      test('should handle string with numbers', () {
        expect(toSnakeCase('Hello123World'), equals('hello123_world'));
      });
    });

    group('toKebabCase', () {
      test('should convert space-separated words to kebab-case', () {
        expect(toKebabCase('Hello World'), equals('hello-world'));
      });

      test('should convert camelCase to kebab-case', () {
        expect(toKebabCase('helloWorld'), equals('hello-world'));
      });

      test('should convert PascalCase to kebab-case', () {
        expect(toKebabCase('HelloWorld'), equals('hello-world'));
      });

      test('should handle single word', () {
        expect(toKebabCase('hello'), equals('hello'));
      });

      test('should handle multiple consecutive hyphens', () {
        expect(toKebabCase('Hello--World'), equals('hello-world'));
      });

      test('should remove leading and trailing hyphens', () {
        expect(toKebabCase('-Hello-World-'), equals('hello-world'));
      });

      test('should handle special characters', () {
        expect(toKebabCase('Hello@World#Test'), equals('hello-world-test'));
      });

      test('should handle empty string', () {
        expect(toKebabCase(''), equals(''));
      });

      test('should handle string with numbers', () {
        expect(toKebabCase('Hello123World'), equals('hello123-world'));
      });

      test('should handle underscore-separated words', () {
        expect(toKebabCase('hello_world'), equals('hello_world'));
      });
    });
  });
}

