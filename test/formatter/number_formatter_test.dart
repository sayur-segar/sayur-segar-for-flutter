import 'package:flutter_test/flutter_test.dart';
import 'package:sayur_segar/src/widgets/utils/formatter.dart';

void main() {
  group('Number Formatter Tests', () {
    group('formatNumber', () {
      test('should format number with default separator', () {
        expect(formatNumber(1000), equals('1,000'));
      });

      test('should format large number', () {
        expect(formatNumber(1000000), equals('1,000,000'));
      });

      test('should format number with custom separator', () {
        expect(formatNumber(1000, separator: '.'), equals('1.000'));
      });

      test('should format number with decimal places', () {
        expect(formatNumber(1234.56, decimalPlaces: 2), equals('1,234.56'));
      });

      test('should pad decimal places', () {
        expect(formatNumber(1234.5, decimalPlaces: 2), equals('1,234.50'));
      });

      test('should truncate decimal places', () {
        expect(formatNumber(1234.56789, decimalPlaces: 2), equals('1,234.56'));
      });

      test('should handle zero', () {
        expect(formatNumber(0), equals('0'));
      });

      test('should handle negative number', () {
        expect(formatNumber(-1000), equals('-1,000'));
      });

      test('should handle small number without separator', () {
        expect(formatNumber(123), equals('123'));
      });

      test('should handle decimal without integer part', () {
        expect(formatNumber(0.56, decimalPlaces: 2), equals('0.56'));
      });
    });

    group('formatCurrency', () {
      test('should format currency with default settings', () {
        expect(formatCurrency(1000000), equals('Rp 1.000.000'));
      });

      test('should format currency with custom symbol', () {
        expect(
          formatCurrency(1000, symbol: '\$'),
          equals('\$ 1.000'),
        );
      });

      test('should format currency with custom separator', () {
        expect(
          formatCurrency(1000, separator: ','),
          equals('Rp 1,000'),
        );
      });

      test('should format currency with decimal places', () {
        expect(
          formatCurrency(1234.56, decimalPlaces: 2),
          equals('Rp 1.234,56'),
        );
      });

      test('should format currency with custom decimal separator', () {
        expect(
          formatCurrency(1234.56, decimalSeparator: '.', decimalPlaces: 2),
          equals('Rp 1.234.56'),
        );
      });

      test('should handle zero', () {
        expect(formatCurrency(0), equals('Rp 0'));
      });

      test('should handle negative number', () {
        expect(formatCurrency(-1000), equals('Rp -1.000'));
      });

      test('should format with US dollar format', () {
        expect(
          formatCurrency(
            1234.56,
            symbol: '\$',
            separator: ',',
            decimalSeparator: '.',
            decimalPlaces: 2,
          ),
          equals('\$ 1,234.56'),
        );
      });
    });

    group('formatPercentage', () {
      test('should format percentage with default settings', () {
        expect(formatPercentage(45.678), equals('45.7%'));
      });

      test('should format percentage with custom decimal places', () {
        expect(formatPercentage(45.678, decimals: 0), equals('46%'));
      });

      test('should format percentage without symbol', () {
        expect(
          formatPercentage(45.678, showSymbol: false),
          equals('45.7'),
        );
      });

      test('should handle zero', () {
        expect(formatPercentage(0), equals('0.0%'));
      });

      test('should handle 100', () {
        expect(formatPercentage(100), equals('100.0%'));
      });

      test('should handle negative percentage', () {
        expect(formatPercentage(-10.5), equals('-10.5%'));
      });

      test('should handle large decimal places', () {
        expect(
          formatPercentage(45.67890123, decimals: 4),
          equals('45.6789%'),
        );
      });
    });

    group('padNumber', () {
      test('should pad number with leading zeros', () {
        expect(padNumber(5, width: 3), equals('005'));
      });

      test('should not pad if number is longer than width', () {
        expect(padNumber(123, width: 2), equals('123'));
      });

      test('should handle zero', () {
        expect(padNumber(0, width: 3), equals('000'));
      });

      test('should use default width of 2', () {
        expect(padNumber(5), equals('05'));
      });

      test('should handle negative number', () {
        expect(padNumber(-5, width: 3), equals('0-5'));
      });

      test('should handle single digit with width 1', () {
        expect(padNumber(5, width: 1), equals('5'));
      });
    });
  });
}

