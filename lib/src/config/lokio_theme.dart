import 'package:flutter/material.dart';

/// Design tokens system for Lokio Design System
///
/// This class provides all the color tokens for buttons and other components.
/// You can customize colors by creating a custom instance.
///
/// Example:
/// ```dart
/// // Use default theme
/// final theme = LokioTheme.defaultTheme();
///
/// // Create custom theme
/// final customTheme = LokioTheme.custom(
///   primaryBackground: Colors.blue,
///   primaryForeground: Colors.white,
/// );
/// ```
class LokioTheme {
  // Primary button colors
  final Color primaryBackground;
  final Color primaryForeground;

  // Secondary button colors
  final Color secondaryBackground;
  final Color secondaryForeground;

  // Outline button colors
  final Color outlineBorder;
  final Color outlineForeground;

  // Text button colors
  final Color textForeground;

  // Icon button colors
  final Color iconBackground;
  final Color iconForeground;

  // Disabled states
  final Color disabledBackground;
  final Color disabledForeground;
  final Color disabledBorder;
  final Color disabledText;

  // Loading state
  final Color loadingColor;

  // Border radius (default)
  final double defaultBorderRadius;

  const LokioTheme({
    required this.primaryBackground,
    required this.primaryForeground,
    required this.secondaryBackground,
    required this.secondaryForeground,
    required this.outlineBorder,
    required this.outlineForeground,
    required this.textForeground,
    required this.iconBackground,
    required this.iconForeground,
    required this.disabledBackground,
    required this.disabledForeground,
    required this.disabledBorder,
    required this.disabledText,
    required this.loadingColor,
    this.defaultBorderRadius = 8.0,
  });

  /// Default theme with modern blue color scheme
  factory LokioTheme.defaultTheme() {
    return const LokioTheme(
      // Primary - Vibrant blue
      primaryBackground: Color(0xFF2196F3),
      primaryForeground: Color(0xFFFFFFFF),

      // Secondary - Light blue/gray
      secondaryBackground: Color(0xFF42A5F5),
      secondaryForeground: Color(0xFFFFFFFF),

      // Outline - Blue border
      outlineBorder: Color(0xFF2196F3),
      outlineForeground: Color(0xFF2196F3),

      // Text - Blue text
      textForeground: Color(0xFF2196F3),

      // Icon - Light background
      iconBackground: Color(0xFFE3F2FD),
      iconForeground: Color(0xFF2196F3),

      // Disabled states
      disabledBackground: Color(0xFFE0E0E0),
      disabledForeground: Color(0xFF9E9E9E),
      disabledBorder: Color(0xFFE0E0E0),
      disabledText: Color(0xFF9E9E9E),

      // Loading
      loadingColor: Color(0xFFFFFFFF),

      defaultBorderRadius: 8.0,
    );
  }

  /// Custom theme with your own colors
  factory LokioTheme.custom({
    Color? primaryBackground,
    Color? primaryForeground,
    Color? secondaryBackground,
    Color? secondaryForeground,
    Color? outlineBorder,
    Color? outlineForeground,
    Color? textForeground,
    Color? iconBackground,
    Color? iconForeground,
    Color? disabledBackground,
    Color? disabledForeground,
    Color? disabledBorder,
    Color? disabledText,
    Color? loadingColor,
    double? defaultBorderRadius,
  }) {
    final defaultTheme = LokioTheme.defaultTheme();
    return LokioTheme(
      primaryBackground: primaryBackground ?? defaultTheme.primaryBackground,
      primaryForeground: primaryForeground ?? defaultTheme.primaryForeground,
      secondaryBackground:
          secondaryBackground ?? defaultTheme.secondaryBackground,
      secondaryForeground:
          secondaryForeground ?? defaultTheme.secondaryForeground,
      outlineBorder: outlineBorder ?? defaultTheme.outlineBorder,
      outlineForeground: outlineForeground ?? defaultTheme.outlineForeground,
      textForeground: textForeground ?? defaultTheme.textForeground,
      iconBackground: iconBackground ?? defaultTheme.iconBackground,
      iconForeground: iconForeground ?? defaultTheme.iconForeground,
      disabledBackground: disabledBackground ?? defaultTheme.disabledBackground,
      disabledForeground: disabledForeground ?? defaultTheme.disabledForeground,
      disabledBorder: disabledBorder ?? defaultTheme.disabledBorder,
      disabledText: disabledText ?? defaultTheme.disabledText,
      loadingColor: loadingColor ?? defaultTheme.loadingColor,
      defaultBorderRadius:
          defaultBorderRadius ?? defaultTheme.defaultBorderRadius,
    );
  }

  /// Create theme from Material 3 ColorScheme
  factory LokioTheme.fromColorScheme(ColorScheme colorScheme) {
    return LokioTheme(
      primaryBackground: colorScheme.primary,
      primaryForeground: colorScheme.onPrimary,
      secondaryBackground: colorScheme.secondary,
      secondaryForeground: colorScheme.onSecondary,
      outlineBorder: colorScheme.outline,
      outlineForeground: colorScheme.primary,
      textForeground: colorScheme.primary,
      iconBackground: colorScheme.surfaceContainerHighest,
      iconForeground: colorScheme.primary,
      disabledBackground: colorScheme.surfaceContainerHighest,
      disabledForeground: colorScheme.onSurfaceVariant.withValues(alpha: 0.38),
      disabledBorder: colorScheme.onSurfaceVariant.withValues(alpha: 0.12),
      disabledText: colorScheme.onSurfaceVariant.withValues(alpha: 0.38),
      loadingColor: colorScheme.onPrimary,
      defaultBorderRadius: 8.0,
    );
  }

  /// Copy with method for creating modified versions
  LokioTheme copyWith({
    Color? primaryBackground,
    Color? primaryForeground,
    Color? secondaryBackground,
    Color? secondaryForeground,
    Color? outlineBorder,
    Color? outlineForeground,
    Color? textForeground,
    Color? iconBackground,
    Color? iconForeground,
    Color? disabledBackground,
    Color? disabledForeground,
    Color? disabledBorder,
    Color? disabledText,
    Color? loadingColor,
    double? defaultBorderRadius,
  }) {
    return LokioTheme(
      primaryBackground: primaryBackground ?? this.primaryBackground,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      outlineBorder: outlineBorder ?? this.outlineBorder,
      outlineForeground: outlineForeground ?? this.outlineForeground,
      textForeground: textForeground ?? this.textForeground,
      iconBackground: iconBackground ?? this.iconBackground,
      iconForeground: iconForeground ?? this.iconForeground,
      disabledBackground: disabledBackground ?? this.disabledBackground,
      disabledForeground: disabledForeground ?? this.disabledForeground,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      disabledText: disabledText ?? this.disabledText,
      loadingColor: loadingColor ?? this.loadingColor,
      defaultBorderRadius: defaultBorderRadius ?? this.defaultBorderRadius,
    );
  }
}
