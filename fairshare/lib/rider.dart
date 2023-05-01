// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, avoid_print, unused_field, unnecessary_null_comparison, unused_element

import 'dart:developer';

import 'package:fairshare/driverlist.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_location_picker/open_location_picker.dart';
import 'driverform.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Rider extends StatefulWidget {
  const Rider({super.key,});
 

  @override
  State<Rider> createState() => _RiderState();
}

class _RiderState extends State<Rider> {
  String placeName = '';

  String referenceId = "";
  final String _selectedVehicle = 'Bike';
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  
  

  void _onLocationSelected(LatLng _placeNameLatLng, LatLng _destinationLatLng) {
    // Calculate the distance and cost here
  }

  Future<LatLng?> searchPlace(String placeName) async {
    try {
      final List<Location> locations = await locationFromAddress(placeName);
      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  LatLng? _pickup;

  LatLng? _destination;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passenger')),
      // ignore: prefer_const_constructors
      body: Center(
        child: Stack(
          children: [
            MapSample(
              pickup: _pickup == null
                  ? const google.LatLng(0, 0)
                  : google.LatLng(
                      _pickup!.latitude,
                      _pickup!.longitude,
                    ),
              destination: _destination == null
                  ? const google.LatLng(0, 0)
                  : google.LatLng(
                      _destination!.latitude,
                      _destination!.longitude,
                    ),
            ),
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
            const ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.home),
              onTap: null,
            ),
            ListTile(
              title: const Text(
                "Schedule",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScheduleRide()));
              },
            ),
            ListTile(
              title: const Text(
                "Schedule List",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.list),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ScheduleList()));
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DriverForm(
                            key: UniqueKey(),
                          )),
                );
              },
              child: const Text('Driver Mode'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200.0),
                  topRight: Radius.circular(200.0),
                ),
              ),
              builder: ((context) {
                //const Mode _mode = Mode.overlay;

                return Material(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                           Container(
            width: 200.0,
            height: 4.0,
            color: Colors.grey,
            margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OpenMapPicker(
                              key: const ValueKey('pickup'),
                              decoration: const InputDecoration(
                                hintText: "My location",
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (FormattedLocation? newValue) {
                                /// save new value
                                log('got new value $newValue');
                                _pickup = LatLng(newValue!.lat, newValue.lon);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OpenMapPicker(
                              key: const ValueKey('destination'),
                              decoration: const InputDecoration(
                                hintText: "Destination",
                                border: OutlineInputBorder( ),
                              ),
                              onChanged: (FormattedLocation? newValue) {
                                /// save new value
                                log('got new value $newValue');
                                _destination =
                                    LatLng(newValue!.lat, newValue.lon);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: const Size(30, 50)),
                                  onPressed: () {
                                    // _storeData(userId);
                                    setState(() {});

                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Find a driver",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                // ignore: dead_code
                SizedBox(
                  height: 400,
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              }));
        },
        label: const Text('Search for driver'),
        icon: const Icon(Icons.search),
      ),
    );
  }
}
