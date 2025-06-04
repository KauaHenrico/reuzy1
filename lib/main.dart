import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reuzy',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {'/chat': (context) => const ChatScreen()},
    );
  }
}
