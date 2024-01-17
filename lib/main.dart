import 'package:cyber_rakshak/constants.dart';
import 'package:cyber_rakshak/screens/dashboard.dart';
import 'package:cyber_rakshak/screens/get_started.dart';
import 'package:cyber_rakshak/screens/login_screen.dart';
import 'package:cyber_rakshak/screens/services/criminal_record/criminal.dart';
import 'package:cyber_rakshak/screens/services/investigation/further_invest.dart';
import 'package:cyber_rakshak/screens/services/investigation/investigation.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: primaryColor),
        ),
        home: const GetStarted());
  }
}
