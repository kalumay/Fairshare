import 'package:fairshare/rider.dart';
import 'package:flutter/material.dart';

import 'driver.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  late String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          RadioListTile(
            value: 'rider',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            title: const Text('Rider'),
          ),
          RadioListTile(
            value: 'driver',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
            title: const Text('Driver'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_selectedOption == 'rider') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RiderForm(),
                  ),
                );
              } else if (_selectedOption == 'driver') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DriverForm(),
                  ),
                );
              }
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
