import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oauhrunner/models/run.dart';
import 'package:oauhrunner/screens/add_event.dart';
import 'package:oauhrunner/screens/settings.dart';
import 'package:oauhrunner/utils/run_db.dart';
import 'package:oauhrunner/utils/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<Run> runs;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final res = await RunDB().fetchAll();
    setState(() {
      runs = res;
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OAUH Runner',
          style: TextStyle(color: Colors.white),
        ),
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
              }, 
              icon: const Icon(Icons.more_vert))
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: isLoading ? const CircularProgressIndicator() 
        : Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: RefreshIndicator(
            onRefresh: load,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: runs.length,
              itemBuilder: (BuildContext context, int index) {
                final date = runs[index].date;
                return GestureDetector(                
                  onTap: () {},                
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      title: Text(
                        runs[index].title,
                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${date.year}-${date.month}-${date.day}",
                        style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}