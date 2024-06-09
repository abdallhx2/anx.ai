import 'package:anx/pages/chat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
          title: 'ChatGPT App',
         //   theme: ThemeData()
         //   locale: locale,
            supportedLocales: [
              Locale('en', ''),
              Locale('ar', ''),
            ],
            localizationsDelegates: [
              // Add your localization delegates here
            ],
            home: AXNchat(),
    );
  }
}
