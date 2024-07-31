import 'package:flutter/material.dart';
import 'package:task_code/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:
            'CustomFont', // The font family name defined in pubspec.yaml
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'CustomFont'),
          bodyLarge: TextStyle(fontSize: 16.0, fontFamily: 'CustomFont'),
          // Define other styles as needed
        ),
      ),
      home: Home(),
    );
  }
}
