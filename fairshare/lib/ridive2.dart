// ignore_for_file: camel_case_types, unused_import

import 'package:fairshare/map.dart';
import 'package:fairshare/rider.dart';
import 'package:flutter/material.dart';
//import 'package:vehicle_renting_and_sharing/rider.dart';

import 'driverform.dart';

class ridrive extends StatefulWidget {
  const ridrive({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ridriveState createState() => _ridriveState();
}

class _ridriveState extends State<ridrive> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [const Text("Select the feature you would like to continue with:",
          style: TextStyle(fontSize: 30),),
            ElevatedButton(
              onPressed: () {
                 Navigator.pushReplacementNamed(context, 'driver');
              },
              child: const Text('Driver'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'rider');
              },
              child: const Text('Passenger'),
            ),
          ],
        ),
      ),
    );
  }
}
