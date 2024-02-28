import 'package:flutter/material.dart';
import 'package:oauhrunner/screens/home_page.dart';
import 'package:oauhrunner/utils/shared_prefs.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await sharedPrefs.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: sharedPrefs.themeMode ? Brightness.dark : Brightness.light,
        primaryColor: Colors.blueGrey
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
