import 'package:flutter/material.dart';
import 'package:sayur_segar/src/config/lokio_theme.dart';
import 'button_types.dart';

/// A customizable button widget with multiple variants, sizes, and states.
///
/// Supports primary, secondary, outline, text, and icon variants with tiny,
/// small, medium, large, and giant sizes. Includes loading state and icon support.
///
/// Example:
/// ```dart
/// LokioButton(
///   onPressed: () {},
///   variant: ButtonVariant.primary,
///   size: ButtonSize.medium,
///   child: Text('Click me'),
/// )
/// ```
class LokioButton extends StatelessWidget {
  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Button variant style
  final ButtonVariant variant;

  /// Button size
  final ButtonSize size;

  /// Child widget (typically Text)
  final Widget? child;

  /// Leading icon (displayed before child, or replaced by loading spinner)
  final Widget? leadingIcon;

  /// Trailing icon (displayed after child)
  final Widget? trailingIcon;

  /// Whether button is in loading state
  /// When true, button is disabled and loading spinner appears in leading position
  final bool isLoading;

  /// Whether to expand button to fill available width
  final bool isExpanded;

  /// Optional custom theme. If not provided, uses default theme.
  final LokioTheme? theme;

  const LokioButton({
    super.key,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.child,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isExpanded = false,
    this.theme,
  }) : assert(
          variant == ButtonVariant.icon
              ? (leadingIcon != null || trailingIcon != null)
              : (child != null || leadingIcon != null || trailingIcon != null),
          'For icon variant, provide leadingIcon or trailingIcon. For other variants, provide child, leadingIcon, or trailingIcon.',
        );

  /// Create a primary button with default styling
  factory LokioButton.primary({
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    Widget? child,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    bool isExpanded = false,
    LokioTheme? theme,
  }) {
    return LokioButton(
      onPressed: onPressed,
      variant: ButtonVariant.primary,
      size: size,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      isExpanded: isExpanded,
      theme: theme,
      child: child,
    );
  }

  /// Create a secondary button with default styling
  factory LokioButton.secondary({
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    Widget? child,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    bool isExpanded = false,
    LokioTheme? theme,
  }) {
    return LokioButton(
      onPressed: onPressed,
      variant: ButtonVariant.secondary,
      size: size,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      isExpanded: isExpanded,
      theme: theme,
      child: child,
    );
  }

  /// Create an outline button with default styling
  factory LokioButton.outline({
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    Widget? child,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    bool isExpanded = false,
    LokioTheme? theme,
  }) {
    return LokioButton(
      onPressed: onPressed,
      variant: ButtonVariant.outline,
      size: size,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      isExpanded: isExpanded,
      theme: theme,
      child: child,
    );
  }

  /// Create a text button with default styling
  factory LokioButton.text({
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    Widget? child,
    Widget? leadingIcon,
    Widget? trailingIcon,
    bool isLoading = false,
    bool isExpanded = false,
    LokioTheme? theme,
  }) {
    return LokioButton(
      onPressed: onPressed,
      variant: ButtonVariant.text,
      size: size,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
      isLoading: isLoading,
      isExpanded: isExpanded,
      theme: theme,
      child: child,
    );
  }

  /// Create an icon button with default styling
  factory LokioButton.icon({
    required VoidCallback? onPressed,
    required Widget icon,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isExpanded = false,
    LokioTheme? theme,
    bool leading = true,
  }) {
    return LokioButton(
      onPressed: onPressed,
      variant: ButtonVariant.icon,
      size: size,
      leadingIcon: leading ? icon : null,
      trailingIcon: leading ? null : icon,
      isLoading: isLoading,
      isExpanded: isExpanded,
      theme: theme,
    );
  }

  @override
  Widget build(BuildContext context) {
    final lokioTheme = theme ?? LokioTheme.defaultTheme();
    
    // If loading, disable button
    final effectiveOnPressed = (isLoading || onPressed == null) ? null : onPressed;
    final isDisabled = effectiveOnPressed == null;

    // Get colors based on variant and state
    final colors = _getColors(lokioTheme, isDisabled);

    // Get dimensions
    final buttonHeight = ButtonConfig.getHeight(size);
    final horizontalPadding = ButtonConfig.getHorizontalPadding(size);
    final borderRadius = ButtonConfig.getBorderRadius(size);
    final iconSize = ButtonConfig.getIconSize(size);
    final fontSize = ButtonConfig.getFontSize(size);

    // Build button content
    Widget buttonContent = _buildButtonContent(
      lokioTheme: lokioTheme,
      colors: colors,
      iconSize: iconSize,
      fontSize: fontSize,
    );

    // Build button based on variant
    Widget button;
    switch (variant) {
      case ButtonVariant.primary:
        button = ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.background,
            foregroundColor: colors.foreground,
            minimumSize: Size(0, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: isDisabled ? 0 : 1,
          ),
          child: buttonContent,
        );
        break;

      case ButtonVariant.secondary:
        button = ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.background,
            foregroundColor: colors.foreground,
            minimumSize: Size(0, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: isDisabled ? 0 : 1,
          ),
          child: buttonContent,
        );
        break;

      case ButtonVariant.outline:
        button = OutlinedButton(
          onPressed: effectiveOnPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: colors.foreground,
            minimumSize: Size(0, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 0,
            ),
            side: BorderSide(
              color: colors.border ?? lokioTheme.outlineBorder,
              width: 0.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: buttonContent,
        );
        break;

      case ButtonVariant.text:
        button = TextButton(
          onPressed: effectiveOnPressed,
          style: TextButton.styleFrom(
            foregroundColor: colors.foreground,
            minimumSize: Size(0, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: buttonContent,
        );
        break;

      case ButtonVariant.icon:
        button = IconButton(
          onPressed: effectiveOnPressed,
          iconSize: iconSize,
          color: colors.foreground,
          style: IconButton.styleFrom(
            backgroundColor: colors.background == Colors.transparent 
                ? null 
                : colors.background,
            foregroundColor: colors.foreground,
            minimumSize: Size(buttonHeight, buttonHeight),
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          icon: buttonContent,
        );
        break;
    }

    if (isExpanded && variant != ButtonVariant.icon) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  Widget _buildButtonContent({
    required LokioTheme lokioTheme,
    required _ButtonColors colors,
    required double iconSize,
    required double fontSize,
  }) {
    final children = <Widget>[];

    // Handle loading state - spinner in leading position
    if (isLoading) {
      children.add(
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colors.foreground),
          ),
        ),
      );
      // Add spacing if there's text
      if (child != null) {
        children.add(const SizedBox(width: 8));
      }
    } else if (leadingIcon != null) {
      // Only show leading icon if not loading
      children.add(
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: IconTheme(
            data: IconThemeData(size: iconSize, color: colors.foreground),
            child: leadingIcon!,
          ),
        ),
      );
      if (child != null) {
        children.add(const SizedBox(width: 8));
      }
    }

    // Add child text
    if (child != null) {
      if (variant == ButtonVariant.icon) {
        // For icon variant, child is ignored
      } else {
        if (child is Text) {
          final textChild = child as Text;
          children.add(
            DefaultTextStyle(
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: colors.foreground,
              ),
              child: textChild,
            ),
          );
        } else {
          children.add(
            DefaultTextStyle(
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: colors.foreground,
              ),
              child: child!,
            ),
          );
        }
      }
    }

    // Add trailing icon (only if not loading)
    if (!isLoading && trailingIcon != null) {
      if (child != null) {
        children.add(const SizedBox(width: 8));
      }
      children.add(
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: IconTheme(
            data: IconThemeData(size: iconSize, color: colors.foreground),
            child: trailingIcon!,
          ),
        ),
      );
    }

    if (variant == ButtonVariant.icon) {
      // For icon button, return just the icon (or loading spinner)
      if (isLoading) {
        return SizedBox(
          width: iconSize,
          height: iconSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(colors.foreground),
          ),
        );
      }
      if (leadingIcon != null) {
        return IconTheme(
          data: IconThemeData(size: iconSize, color: colors.foreground),
          child: leadingIcon!,
        );
      }
      if (trailingIcon != null) {
        return IconTheme(
          data: IconThemeData(size: iconSize, color: colors.foreground),
          child: trailingIcon!,
        );
      }
      return const SizedBox.shrink();
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  _ButtonColors _getColors(LokioTheme lokioTheme, bool isDisabled) {
    if (isDisabled) {
      return _ButtonColors(
        background: lokioTheme.disabledBackground,
        foreground: lokioTheme.disabledForeground,
        border: lokioTheme.disabledBorder,
      );
    }

    switch (variant) {
      case ButtonVariant.primary:
        return _ButtonColors(
          background: lokioTheme.primaryBackground,
          foreground: lokioTheme.primaryForeground,
          border: null,
        );

      case ButtonVariant.secondary:
        return _ButtonColors(
          background: lokioTheme.secondaryBackground,
          foreground: lokioTheme.secondaryForeground,
          border: null,
        );

      case ButtonVariant.outline:
        return _ButtonColors(
          background: Colors.transparent,
          foreground: lokioTheme.outlineForeground,
          border: lokioTheme.outlineBorder,
        );

      case ButtonVariant.text:
        return _ButtonColors(
          background: Colors.transparent,
          foreground: lokioTheme.textForeground,
          border: null,
        );

      case ButtonVariant.icon:
        return _ButtonColors(
          background: lokioTheme.iconBackground,
          foreground: lokioTheme.iconForeground,
          border: null,
        );
    }
  }
}

/// Helper class for button colors
class _ButtonColors {
  final Color background;
  final Color foreground;
  final Color? border;

  const _ButtonColors({
    required this.background,
    required this.foreground,
    this.border,
  });
}
