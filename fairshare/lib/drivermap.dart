// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, avoid_print, avoid_types_as_parameter_names, unused_field


import 'package:fairshare/home.dart';
import 'package:fairshare/rider.dart';
import 'package:fairshare/vehiclist.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth _auth = FirebaseAuth.instance;

class DriverMap extends StatefulWidget {
  const DriverMap({super.key});

  @override
  State<DriverMap> createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  String referenceId = "";
  final String _selectedVehicle = 'Bike';
  //List<String> vehicleType=['Bike','Car'];
  //String? selectVehicle;
 
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: const Text('Driver')),
      // ignore: prefer_const_constructors
      body: 
      Center(
        child: Stack(
          children: [
            const Text('Passenger List'),
            /// Passenger List function here
          ],
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    width: 100,
                    height: 150,
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                "Home",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Homes(
                              userId: '',
                            )));
              },
            ),
            
            ListTile(
              title: const Text(
                "Passenger List",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.list_alt),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PassengerList()));
               //passenger list function
              },
            ),
            ListTile(
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.logout),
              onTap: () async {
                await _auth.signOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'phone');
              },
            ),
            ListTile(
              title: const Text(
                "Rate this app",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Rate()));
              },
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Rider()));
              },
              child: const Text('Passenger Mode'),
            ),
          ],
        ),
      ),
    ); 
  }
}
