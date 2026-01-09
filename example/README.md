# Sayur Segar Example App - Storybook Manual

This example app serves as a **manual Storybook** for the Sayur Segar package. It provides an interactive visual documentation and playground for all components and utilities in the package.

## 🎯 Purpose

This example app replaces the need for a separate Storybook setup by providing:
- **Visual Component Library**: Browse and interact with all UI components
- **Live Examples**: See all formatter utilities in action with real input/output
- **Interactive Playground**: Test components and utilities directly in the app
- **Complete Documentation**: Every feature is demonstrated with examples

## 📱 Features

### 1. Button Components Showcase
- **All Variants**: Primary, Secondary, Outline, Text, Icon
- **All Sizes**: Tiny, Small, Medium, Large, Giant
- **States**: Loading, Disabled, Expanded
- **Icons**: Leading and trailing icon support
- **Interactive**: Click buttons to see loading states

### 2. Formatter Utilities Documentation
- **String Formatters**: 6+ utilities with live examples
- **Number Formatters**: Currency, percentage, number formatting
- **Date & Time**: Date formatting, relative time, duration
- **Case Converters**: camelCase, snake_case, kebab-case conversions
- **Special Formatters**: Phone, credit card, file size, masking

## 🚀 Running the Storybook

1. Navigate to the example directory:
   ```bash
   cd example
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## 📖 How to Use as Storybook

### For Developers
- **Browse Components**: Navigate through the app to see all available components
- **Copy Examples**: Use the examples as reference when implementing in your app
- **Test Interactions**: Interact with components to understand their behavior
- **See All Variants**: Compare different variants and sizes side by side

### For Designers
- **Visual Reference**: See all components in their actual rendered state
- **Size Comparison**: Compare all button sizes to choose the right one
- **Style Variants**: See all style variants (primary, secondary, outline, etc.)
- **Interactive States**: Test loading and disabled states

### For Product Managers
- **Feature Overview**: Get a complete overview of all available features
- **Formatter Capabilities**: See what formatting utilities are available
- **Component Library**: Understand what UI components can be used

## 🎨 Navigation

The app uses a bottom navigation bar with two main sections:

1. **Buttons** - All button components and variants
2. **Formatters** - All formatter utilities with examples

## 📋 Example Structure

Each example shows:
- **Component/Function Name**: Clear title
- **Input**: What goes into the function/component
- **Output**: What comes out (for formatters)
- **Visual Rendering**: How it looks (for components)

## 💡 Tips

- **Scroll through sections**: Each category has multiple examples
- **Interact with buttons**: Click buttons to see loading states
- **Compare variants**: See all button variants side by side
- **Copy code**: Use the examples as starting points for your implementation

## 🔄 Updating the Storybook

When adding new components or utilities to the package:
1. Add examples to the appropriate section in `lib/main.dart`
2. Follow the existing pattern for consistency
3. Test the example app to ensure everything works
4. Update this README if needed

## 📝 Notes

- This example app uses the local package from the parent directory
- All examples are interactive and demonstrate real-world usage
- The app follows Material Design 3 guidelines
- Examples are kept simple and focused on demonstrating functionality

---

**This is your Storybook manual - use it to explore, learn, and reference all features of Sayur Segar!**
