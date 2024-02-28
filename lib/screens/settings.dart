import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oauhrunner/main.dart';
import 'package:oauhrunner/utils/shared_prefs.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();

    isSelected = sharedPrefs.themeMode;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nastavení'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  const Text("Tmavý režim"),
                  Switch(
                    value: isSelected,
                    activeColor: Colors.blue,
                    onChanged: (bool value) {
                      setState(() {
                        isSelected = value;
                        sharedPrefs.themeMode = value;

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainApp()),
                        );
                      });
                    },
                  ),
                ],
              )
            ],
          ),
      ),
    );      
  }
}
