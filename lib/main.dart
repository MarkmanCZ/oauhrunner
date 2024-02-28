import 'package:flutter/material.dart';
import 'package:oauhrunner/screens/home_page.dart';
import 'package:oauhrunner/utils/shared_prefs.dart';

Future<void> main() async {
  await sharedPrefs.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
