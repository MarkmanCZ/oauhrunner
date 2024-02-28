import 'package:flutter/material.dart';
import 'package:oauhrunner/models/run.dart';
import 'package:oauhrunner/utils/run_db.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {

  final TextEditingController title = TextEditingController();
  final TextEditingController start = TextEditingController();
  final TextEditingController end = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    
    if (picked != null && picked != _selectedDate) {
      setState(() { 
        _selectedDate = picked;
      });
    }
  }

  void addRun() async {
    final run = Run(null, title.text, start.text, end.text, _selectedDate);
    
    RunDB().create(run);
    setState(() {
      _selectedDate = DateTime.now();
      title.text = "";
      start.text = "";
      end.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Přidat běh'),
        backgroundColor: Colors.blue,
      ),
      body:  SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Název',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'Zadej název',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Datum běhu',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text(
                      'Vyber datum',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Start běhu',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                controller: start,
                decoration: const InputDecoration(
                  hintText: 'Napiš místo startu',
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Cíl běhu',
                style: TextStyle(fontSize: 16.0),
              ),
              TextFormField(
                controller: end,
                decoration: const InputDecoration(
                  hintText: 'Napiš cíl běhu',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 30.0),
                child: ElevatedButton(
                  onPressed: addRun, 
                  child: const Text("Uložit")
                ),
              )
            ],
          ),
        ),
      )
    );      
  }
}