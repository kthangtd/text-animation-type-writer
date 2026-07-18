import 'package:animate_type_writer/animate_type_writer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Animation - Type Writer',
      theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: const MyHomePage(title: 'Text Animation - Type Writer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final tertiaryStyle = TextStyle(color: Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AnimTypeWriter(
          key: UniqueKey(),
          cursor: const AnimBlinkCursor(),
          duration: const Duration(seconds: 12),
          textSpan: TextSpan(
            children: [
              TextSpan(text: 'Flying commercial wastes more than 2 hours'),
              TextSpan(
                text: ' on every Sydney–Melbourne round trip. Yet with',
                style: tertiaryStyle,
              ),
              TextSpan(text: r' private charters costing $11,000 one-way'),
              TextSpan(
                text: ', most have been left behind —',
                style: tertiaryStyle,
              ),
              TextSpan(text: ' until now.'),
            ],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFFe6e6e6),
            ),
          ),
        ),
      ),
    );
  }
}
