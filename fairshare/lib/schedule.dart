// ignore_for_file: avoid_print, unused_element, file_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'driverlist.dart';

final _firestore = FirebaseFirestore.instance;

class ScheduleRide extends StatefulWidget {
  const ScheduleRide({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleRideState createState() => _ScheduleRideState();
}

class _ScheduleRideState extends State<ScheduleRide> {
  final TextEditingController sname = TextEditingController();
  final TextEditingController saddress = TextEditingController();
  final TextEditingController daddress = TextEditingController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
 String? _selectedFrequency = 'Once a week';
String? _selectedDuration = '1 month';


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule a Ride'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Schedule Name:",style: TextStyle(fontSize: 20),),
              ), 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(controller: sname,
                decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'College Going Schedule/Home Returning Schedule',),
                    ),
             ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Starting address:",style: TextStyle(fontSize: 20),),
              ), 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(controller: saddress,
               decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Talchikhel',),
                    ),
             ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Destination address:",style: TextStyle(fontSize: 20)),
                    ), 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(controller: daddress,
               decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Boudha',),
                    ),
             ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: ${DateFormat('yyyy-MM-dd').format(_date)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select date'),
              ),
                ],
                
              ),
              
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time: ${_time.format(context)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: const Text('Select time'),
              ),
                ],
              ),
              
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Frequency:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
             DropdownButton<String>(
  value: _selectedFrequency,
  onChanged: (String? newValue) {
    setState(() {
        _selectedFrequency = newValue;
    });
  },
  items: <String>['Once a week','Daily','Custom'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
    );
  }).toList(),
),
                ],
              ),
              
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Duration:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
              DropdownButton<String>(
  value: _selectedDuration,
  onChanged: (String? newValue) {
    setState(() {
        _selectedDuration = newValue;
    });
  },
  items: <String>['1 month','Once','Custom'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
    );
  }).toList(),
),
                ],
              ),
              

              const SizedBox(height: 20, width: double.infinity,),
              Center(
                child: ElevatedButton(

                 onPressed: () {
  String snameValue = sname.text;
  String saddressValue = saddress.text;
  String daddressValue = daddress.text;
  final time = DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute);
addDataToFirestore(snameValue, saddressValue, daddressValue);
  // Store the entered values in a map
  Map<String, String> rideDetails = {
    'schedule_name': snameValue,
    'start_address': saddressValue,
    'destination_address': daddressValue,
    'time': time.toIso8601String(),
  };

  // Print the ride details to the console for debugging purposes
  print('Ride Details:');
  rideDetails.forEach((key, value) {
    print('$key: $value');
  });
},

                  child: const Text('Subscribe'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
 void addDataToFirestore(String snameValue, String saddressValue, String daddressValue) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    // User is not authenticated, handle it accordingly
    return;
  }

  try {
    final time = DateTime(_date.year, _date.month, _date.day, _time.hour, _time.minute);
    await _firestore.collection('Rides').add({
      'scheduleName': snameValue,
      'startingAddress': saddressValue,
      'destinationAddress': daddressValue,
      'userId': user.uid,
      'time': time.toIso8601String(),
    });
     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  ScheduleList()));
    Fluttertoast.showToast(
      msg: "Ride scheduled successfully!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    
  } catch (e) {
    Fluttertoast.showToast(
      msg: "Failed to schedule ride: $e",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}

}
