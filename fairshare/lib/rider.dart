// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, avoid_print, unused_field

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'driverform.dart';

//import 'package:vehicle_renting_and_sharing/settingpage.dart';
FirebaseAuth _auth = FirebaseAuth.instance;
// void showPlacePicker() async {
//     var customLocation;
//     LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) =>
//             PlacePicker("YOUR API KEY",
//                         displayLocation: customLocation,
//                         )));

//     // Handle the result in your way
//     print(result);
// }
class Rider extends StatefulWidget {
  const Rider({super.key});

  @override
  State<Rider> createState() => _RiderState();
}

class _RiderState extends State<Rider> {
  
  String referenceId = "";
  final String _selectedVehicle = 'Bike';
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: const Text('Passenger')),
      // ignore: prefer_const_constructors
      body:   Center(
      child: Stack(
       
          children:   [MapSample
          
          (onLocationSelected: (_pickupLatLng ,_destinationLatLng ) {  },), 
        
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
                // Text("Hello Rider!!",style: TextStyle(fontSize: 20),
                // textAlign: TextAlign.left,),
               
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
            // const ListTile(
            //   title: Text(
            //     "Travel history",
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            //   leading: Icon(Icons.lock_clock_rounded),
            //   onTap: null,
            // ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const ScheduleRide()));
              },
            ),
            ListTile(
              title: const Text(
                "Driver list",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.list_alt),
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Rate()));
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
              MaterialPageRoute(builder: (context) =>  DriverForm(key: UniqueKey(),)),
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
              builder: ((context) {
                //const Mode _mode = Mode.overlay;
               
                return Material(
                  child: Column(
                    children: <Widget>[
                    //  SearchMapPlaceWidget(
                    //   clearIcon: Icons.clear,
                    //   icon: Icons.search,
                    //   strictBounds: false,
                    //   apiKey: googleAPIkey , 
                    //   hasClearButton: true,
                    //   placeType: PlaceType.address,
                    //   placeholder: "Pickup Location",
                    //   onSelected:(Place place)async{
                    //     Geolocation? geolocation=await place.geolocation;
                    //     mapController.animateCamera(
                    //       CameraUpdate.newLatLng(geolocation?.coordinates)
                    //     );
                    //     mapController.animateCamera(
                    //       CameraUpdate.newLatLngBounds(geolocation?.bounds,0)
                    //     );
                    //   } ,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                          hintText: " location ",
                          labelText: " Your location",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        )),
                      ),
                        // Expanded(
                        //   child: 
                        //   ListView.builder(
                        //     shrinkWrap: true,
                        //   itemCount: placePredictions.length,
                        //   itemBuilder: (context,index)=> LocationListTile(
                        //     press:(){},
                        //     location: placePredictions[index].description!,
                        //   )),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                         // onTap: _handlePressButton,
                          decoration: InputDecoration(
                            hintText: "Destination",
                            labelText: "Enter Destination",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "price",
                            labelText: " Offer your fare price",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
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
                                Navigator.pushNamed(context, "drivermap");
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
