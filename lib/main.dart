import 'package:flutter/material.dart';
import 'package:practical_exam/view/quote_screen.dart';
import 'package:practical_exam/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialRoute: "splash_screen",
      routes: {
        "/": (context) => QuotePage(),
        "splash_screen": (context) => IntroScreen(),
      },
    );
  }
}
