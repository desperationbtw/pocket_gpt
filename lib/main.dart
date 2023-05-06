import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/home_screen.dart/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PocketGPT',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xff1e1a2b),
        scaffoldBackgroundColor: const Color(0xff151220),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Color(0xff1e1a2b),
          backgroundColor: Color(0xff1e1a2b),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff1e1a2b),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}