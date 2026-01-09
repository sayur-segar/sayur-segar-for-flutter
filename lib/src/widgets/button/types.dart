/// Button variants for different use cases
enum ButtonVariant {
  /// Primary button - main call-to-action
  primary,

  /// Secondary button - secondary actions
  secondary,

  /// Outline button - outlined style
  outline,

  /// Text button - minimal style
  text,

  /// Icon button - icon only
  icon,
}

/// Button sizes
enum ButtonSize {
  /// Tiny button - 24px height
  tiny,

  /// Small button - 32px height
  small,

  /// Medium button - 40px height (default)
  medium,

  /// Large button - 48px height
  large,

  /// Giant button - 56px height
  giant,
}

/// Configuration helper for button styling
class ButtonConfig {
  /// Get height based on button size
  static double getHeight(ButtonSize size) {
    switch (size) {
      case ButtonSize.tiny:
        return 30.0;
      case ButtonSize.small:
        return 34.0;
      case ButtonSize.medium:
        return 40.0;
      case ButtonSize.large:
        return 48.0;
      case ButtonSize.giant:
        return 56.0;
    }
  }

  /// Get horizontal padding based on button size
  static double getHorizontalPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.tiny:
        return 8.0;
      case ButtonSize.small:
        return 12.0;
      case ButtonSize.medium:
        return 16.0;
      case ButtonSize.large:
        return 20.0;
      case ButtonSize.giant:
        return 24.0;
    }
  }

  /// Get icon size based on button size
  static double getIconSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.tiny:
        return 14.0;
      case ButtonSize.small:
        return 16.0;
      case ButtonSize.medium:
        return 20.0;
      case ButtonSize.large:
        return 24.0;
      case ButtonSize.giant:
        return 28.0;
    }
  }

  /// Get font size based on button size
  static double getFontSize(ButtonSize size) {
    switch (size) {
      case ButtonSize.tiny:
        return 12.0;
      case ButtonSize.small:
        return 14.0;
      case ButtonSize.medium:
        return 16.0;
      case ButtonSize.large:
        return 18.0;
      case ButtonSize.giant:
        return 20.0;
    }
  }

  /// Get border radius based on button size
  static double getBorderRadius(ButtonSize size) {
    switch (size) {
      case ButtonSize.tiny:
        return 8.0;
      case ButtonSize.small:
        return 10.0;
      case ButtonSize.medium:
        return 12.0;
      case ButtonSize.large:
        return 16.0;
      case ButtonSize.giant:
        return 18.0;
    }
  }
}
