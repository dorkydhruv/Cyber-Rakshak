import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/get_started.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cyber Rakshak',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.dark(
              primary: primaryColor,
            )),
        home: const GetStarted());
  }
}
