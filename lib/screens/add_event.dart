import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textInput1Controller = TextEditingController();
  final TextEditingController _textInput2Controller = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Přidat běh'),
        backgroundColor: Colors.blue,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Název',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: _titleController,
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
                    style: TextStyle(fontSize: 16.0),
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
              controller: _textInput1Controller,
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
              controller: _textInput2Controller,
              decoration: const InputDecoration(
                hintText: 'Napiš cíl běhu',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 30.0),
              child: ElevatedButton(
                onPressed: () {}, 
                child: Text("Uložit")
              ),
            )
          ],
        ),
      ),
    );      
  }
}