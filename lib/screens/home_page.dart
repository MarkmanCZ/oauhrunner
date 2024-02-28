import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oauhrunner/screens/add_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OAUH Runner'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddEventScreen()));
              },
              icon: const Icon(Icons.add)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                Fluttertoast.showToast(msg: "TESTST");
              }, 
              icon: const Icon(Icons.more_vert))
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}