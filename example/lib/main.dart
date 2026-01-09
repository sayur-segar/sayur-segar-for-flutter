import 'package:flutter/material.dart';
import 'package:sayur_segar/sayur_segar.dart';

void main() {
  runApp(const SayurSegarExampleApp());
}

class SayurSegarExampleApp extends StatelessWidget {
  const SayurSegarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayur Segar Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ButtonsExample(),
    const FormattersExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayur Segar Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets),
            label: 'Buttons',
          ),
          NavigationDestination(
            icon: Icon(Icons.format_quote_outlined),
            selectedIcon: Icon(Icons.format_quote),
            label: 'Formatters',
          ),
        ],
      ),
    );
  }
}

class ButtonsExample extends StatefulWidget {
  const ButtonsExample({super.key});

  @override
  State<ButtonsExample> createState() => _ButtonsExampleState();
}

class _ButtonsExampleState extends State<ButtonsExample> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
    if (_isLoading) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Button Variants',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildSection('Primary Buttons', [
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.primary,
              size: ButtonSize.tiny,
              child: const Text('Tiny'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.primary,
              size: ButtonSize.small,
              child: const Text('Small'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.primary,
              size: ButtonSize.medium,
              child: const Text('Medium'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.primary,
              size: ButtonSize.large,
              child: const Text('Large'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.primary,
              size: ButtonSize.giant,
              child: const Text('Giant'),
            ),
          ]),
          _buildSection('Secondary Buttons', [
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.secondary,
              child: const Text('Secondary'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.secondary,
              isExpanded: true,
              child: const Text('Expanded Secondary'),
            ),
          ]),
          _buildSection('Outline Buttons', [
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.outline,
              child: const Text('Outline'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.outline,
              isExpanded: true,
              child: const Text('Expanded Outline'),
            ),
          ]),
          _buildSection('Text Buttons', [
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.text,
              child: const Text('Text Button'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.text,
              isExpanded: true,
              child: const Text('Expanded Text'),
            ),
          ]),
          _buildSection('Icon Buttons', [
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.icon,
              leadingIcon: const Icon(Icons.favorite),
              child: const Text('With Icon'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: () {},
              variant: ButtonVariant.primary,
              leadingIcon: const Icon(Icons.add),
              trailingIcon: const Icon(Icons.arrow_forward),
              child: const Text('Both Icons'),
            ),
          ]),
          _buildSection('Loading State', [
            LokioButton(
              onPressed: _isLoading ? null : _toggleLoading,
              variant: ButtonVariant.primary,
              isLoading: _isLoading,
              child: const Text('Click to Load'),
            ),
            const SizedBox(height: 8),
            LokioButton(
              onPressed: null,
              variant: ButtonVariant.primary,
              child: const Text('Disabled'),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class FormattersExample extends StatefulWidget {
  const FormattersExample({super.key});

  @override
  State<FormattersExample> createState() => _FormattersExampleState();
}

class _FormattersExampleState extends State<FormattersExample> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Formatter Utilities',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildStringFormatters(),
          const SizedBox(height: 24),
          _buildNumberFormatters(),
          const SizedBox(height: 24),
          _buildDateFormatters(),
          const SizedBox(height: 24),
          _buildCaseConverters(),
          const SizedBox(height: 24),
          _buildSpecialFormatters(),
        ],
      ),
    );
  }

  Widget _buildStringFormatters() {
    return _buildSection('String Formatters', [
      _buildExampleCard('Capitalize', 'hello world', capitalize('hello world')),
      _buildExampleCard(
        'Capitalize Words',
        'hello world',
        capitalizeWords('hello world'),
      ),
      _buildExampleCard(
        'Truncate',
        'This is a very long text',
        truncate('This is a very long text', 15),
      ),
      _buildExampleCard('Slugify', 'Hello World!', slugify('Hello World!')),
      _buildExampleCard(
        'Remove Whitespace',
        'Hello World',
        removeWhitespace('Hello World'),
      ),
      _buildExampleCard(
        'Format Initials',
        'John Michael Doe',
        formatInitials('John Michael Doe'),
      ),
    ]);
  }

  Widget _buildNumberFormatters() {
    return _buildSection('Number Formatters', [
      _buildExampleCard('Format Number', '1000000', formatNumber(1000000)),
      _buildExampleCard(
        'Format Number (Decimal)',
        '1234.567',
        formatNumber(1234.567, decimalPlaces: 2),
      ),
      _buildExampleCard(
        'Format Currency (IDR)',
        '1000000',
        formatCurrency(1000000),
      ),
      _buildExampleCard(
        'Format Currency (USD)',
        '1234.56',
        formatCurrency(
          1234.56,
          symbol: '\$',
          separator: ',',
          decimalSeparator: '.',
          decimalPlaces: 2,
        ),
      ),
      _buildExampleCard(
        'Format Percentage',
        '45.678',
        formatPercentage(45.678),
      ),
      _buildExampleCard('Pad Number', '5 (width: 3)', padNumber(5, width: 3)),
    ]);
  }

  Widget _buildDateFormatters() {
    final now = DateTime.now();
    final twoHoursAgo = now.subtract(const Duration(hours: 2));
    final twoDaysAgo = now.subtract(const Duration(days: 2));

    return _buildSection('Date & Time Formatters', [
      _buildExampleCard(
        'Format Date',
        'DateTime.now()',
        formatDate(now, 'dd/MM/yyyy'),
      ),
      _buildExampleCard(
        'Format Date (Full)',
        'DateTime.now()',
        formatDate(now, 'dd MMMM yyyy'),
      ),
      _buildExampleCard(
        'Format Date (With Time)',
        'DateTime.now()',
        formatDate(now, 'dd/MM/yyyy HH:mm:ss'),
      ),
      _buildExampleCard(
        'Relative Time (Hours)',
        '2 hours ago',
        formatRelativeTime(twoHoursAgo),
      ),
      _buildExampleCard(
        'Relative Time (Days)',
        '2 days ago',
        formatRelativeTime(twoDaysAgo),
      ),
      _buildExampleCard(
        'Format Duration',
        '2h 30m 45s',
        formatDuration(const Duration(hours: 2, minutes: 30, seconds: 45)),
      ),
    ]);
  }

  Widget _buildCaseConverters() {
    return _buildSection('Case Converters', [
      _buildExampleCard(
        'To Camel Case',
        'hello world',
        toCamelCase('hello world'),
      ),
      _buildExampleCard(
        'To Snake Case',
        'Hello World',
        toSnakeCase('Hello World'),
      ),
      _buildExampleCard(
        'To Kebab Case',
        'Hello World',
        toKebabCase('Hello World'),
      ),
      _buildExampleCard(
        'To Title Case',
        'hello world',
        toTitleCase('hello world'),
      ),
    ]);
  }

  Widget _buildSpecialFormatters() {
    return _buildSection('Special Formatters', [
      _buildExampleCard(
        'Format Phone Number',
        '081234567890',
        formatPhoneNumber('081234567890'),
      ),
      _buildExampleCard(
        'Format Credit Card',
        '1234567890123456',
        formatCreditCard('1234567890123456'),
      ),
      _buildExampleCard('Format Bytes', '1048576', formatBytes(1048576)),
      _buildExampleCard(
        'Mask Email',
        'john.doe@example.com',
        mask('john.doe@example.com'),
      ),
      _buildExampleCard(
        'Mask Phone',
        '081234567890',
        mask('081234567890', visibleStart: 4, visibleEnd: 4),
      ),
    ]);
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildExampleCard(String title, String input, String output) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Input:',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(input, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.arrow_forward, size: 20),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Output:',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        output,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
