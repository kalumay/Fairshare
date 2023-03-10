// // ignore_for_file: prefer_const_declarations, no_leading_underscores_for_local_identifiers

// import 'package:fairshare/map.dart';
// import 'package:fairshare/rate.dart';
// import 'package:fairshare/rider.dart';
// import 'package:fairshare/schedule.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:getwidget/components/toggle/gf_toggle.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_maps_webservice/src/places.dart';

// FirebaseAuth _auth = FirebaseAuth.instance;

// class DriverMap extends StatefulWidget {
//   const DriverMap({super.key});

//   @override
//   State<DriverMap> createState() => _DriverMapState();
// }

// class _DriverMapState extends State<DriverMap> {
//   LatLng? _pickup;
//   LatLng? _destination;

//   void _onLocationSelected(LatLng pickup, LatLng destination) {
//     setState(() {
//       _pickup = pickup;
//       _destination = destination;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Driver')),
//       // ignore: prefer_const_constructors
//       body:   Center(
//       child: Stack(
//           children:  const [Maps(onLocationSelected: _onLocationSelected),
//            if (_pickup != null && _destination != null)
//             ],
//       ),
//     ),

//       drawer: Drawer(
//         child: Column(
//           children: <Widget>[
//             Container(
//               color: Theme.of(context).primaryColor,
//               width: double.infinity,
//               child: Column(
//                 children: const <Widget>[
//                   SizedBox(
//                     width: 100,
//                     height: 150,
//                   )
//                 ],
//               ),
//             ),
//             const ListTile(
//               title: Text(
//                 "Home",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               leading: Icon(Icons.home),
//               onTap: null,
//             ),
//             const ListTile(
//               title: Text(
//                 "Travel history",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               leading: Icon(Icons.lock_clock_rounded),
//               onTap: null,
//             ),
//             ListTile(
//               title: const Text(
//                 "Active Status",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               leading: const Icon(Icons.how_to_reg_rounded),
//               onTap: () {

//           },
//             ),
//             GFToggle(
//     onChanged: (val){},
//     value: true,
//  ),

//             ListTile(
//               title: const Text(
//                 "Schedule",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               leading: const Icon(Icons.settings),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) =>  const ScheduleRide()));
//               },
//             ),

//               ListTile(
//               title: const Text(
//                 "Logout",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               leading: const Icon(Icons.logout),
//               onTap: () async {
//                  await _auth.signOut();
//             // ignore: use_build_context_synchronously
//              Navigator.pushReplacementNamed(context, 'phone');
//           },
//             ),

//             ListTile(
//               title: const Text(
//                 "Rate this app",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               leading: const Icon(Icons.settings),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const Rate()));
//               },
//             ),

//              ElevatedButton(
//                         onPressed: () {
//                         Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const Dlist()));
//                         },
//                         child: const Text('Passenger Mode'),
//                       ),
//           ],
//         ),
//       ),

//        floatingActionButton: FloatingActionButton.extended(
//   onPressed: () {
//     showModalBottomSheet(
//        context: context,

//             builder: ((context) {
//               var googleAPIkey='';
//               final Mode _mode=Mode.overlay;
//               return Material(
//                 child: Column(
//                   // ignore: prefer_const_literals_to_create_immutables
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Prediction? p=PlacesAutocomplete.show(
//                         context:context,
//                         apiKey: googleAPIkey,
//                         onError:onError,
//                         mode: _mode,
//                         strictbounds:false,
//                         types:[""],
//                         decoration: InputDecoration(
//                            hintText: " location ",
//                           labelText: " Your location",
//                          border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
//                         //components:[Component(Component.country,"pk")]
//                         )
//                       );
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         decoration:InputDecoration(
//                           hintText: "Destination",
//                           labelText: "Enter Destination",
//                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         decoration:InputDecoration(
//                           hintText: "price",
//                           labelText: " Offer your fare price",
//                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 50.0,
//                     ),
//                     Column(
//                       children: [
//                         ElevatedButton(
//                             style: TextButton.styleFrom(
//                                 minimumSize: const Size(30, 50)
//                                 ),
//                             onPressed: () {
//                              // _storeData(userId);
//                               Navigator.pushNamed(context, "drivermap");
//                             },
//                             child: const Text(
//                               "Find a passenger",
//                               style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             )
//                           ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//               // ignore: dead_code
//               SizedBox(
//                 height: 400,
//                 child: Center(
//                   child: ElevatedButton(
//                     child: const Text('close'),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               );
//             }
//            )
//     );
//   },
//   label: const Text('Search for Passenger'),
//   icon: const Icon(Icons.search),
// ),
//   );
// }
// //  void _storeData(String userId) async {
// //   try {
// //     DocumentReference docRef = FirebaseFirestore.instance
// //         .collection('rideOffers')
// //         .doc(userId);

// //     await docRef.set({
// //       'location': _locationController.text,
// //       'destination': _destinationController.text,
// //       'price': _priceController.text,
// //       'driverId': userId,
// //       'status': 'Pending',
// //     });

// //     Fluttertoast.showToast(
// //         msg: "Data stored successfully!",
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         timeInSecForIosWeb: 1,
// //         backgroundColor: Colors.green,
// //         textColor: Colors.white,
// //         fontSize: 16.0);
// //   } catch (e) {
// //     Fluttertoast.showToast(
// //         msg: "Failed to store data: $e",
// //         toastLength: Toast.LENGTH_SHORT,
// //         gravity: ToastGravity.BOTTOM,
// //         timeInSecForIosWeb: 1,
// //         backgroundColor: Colors.red,
// //         textColor: Colors.white,
// //         fontSize: 16.0);
// //   }
// // }

// ignore_for_file: unused_import, unused_field, no_leading_underscores_for_local_identifiers, unused_local_variable, depend_on_referenced_packages, implementation_imports, avoid_web_libraries_in_flutter, non_constant_identifier_names, prefer_null_aware_operators


import 'dart:convert';
//import 'dart:js';
import 'dart:ui' show lerpDouble;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fairshare/Schedule.dart';
import 'package:fairshare/rate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'rider.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/rendering/box.dart';


FirebaseAuth _auth = FirebaseAuth.instance;

class DriverMap extends StatefulWidget {
  const DriverMap({Key? key}) : super(key: key);

  @override
  State<DriverMap> createState() => _DriverMapState();
}

 class _DriverMapState extends State<DriverMap> {
  LatLng? _pickup;
  LatLng? _destination;
  //List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);

  void _onLocationSelected(LatLng pickup, LatLng destination) {
    setState(() {
      _pickup = pickup;
      _destination = destination;
    });
  }
late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver')),
      body: Center(
        child: Stack(
          children: [
            Maps(onLocationSelected: _onLocationSelected),
            if (_pickup != null && _destination != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           //.. List<Placemark> placemarks = await placemarkFromCoordinates(_pickup!.latitude, _pickup!.longitude),
                            const Text('Pickup location:'),
                            Text('${_pickup!.latitude}, ${_pickup!.longitude}'),
                            const SizedBox(height: 16),
                            const Text('Destination:'),
                            Text(
                                '${_destination!.latitude}, ${_destination!.longitude}'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to a new page to show the ride details
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const Dlist()));
                        },
                        child: const Text('Start ride'),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SizedBox(
          height:MediaQuery.of(context).size.height,
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
                    )
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
              const ListTile(
                title: Text(
                  "Travel history",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(Icons.lock_clock_rounded),
                onTap: null,
              ),
              Row(
                children: [
                  ListTile(
                    title: const Text(
                      "Active Status",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    leading: const Icon(Icons.how_to_reg_rounded),
                    onTap: () {},
                  ),
                  GFToggle(
                    onChanged: (val) {},
                    value: true,
                  ),
                ],
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
                  Navigator.push(
                      context,
                      // ignore: prefer_const_constructors
                      MaterialPageRoute(builder: (context) => Dlist()));
                },
                child: const Text('Passenger Mode'),
              ),
            ],
          ),
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
                                "Find a passenger",
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
        label: const Text('Search for Passenger'),
        icon: const Icon(Icons.search),
      ),
    );
  }
}
class Maps extends StatefulWidget {
  final Function(LatLng, LatLng) onLocationSelected;

  const Maps({Key? key, required this.onLocationSelected}) : super(key: key);

  @override
  State<Maps> createState() => _MapSState();
}

class _MapSState extends State<Maps> {
  late GoogleMapController _controller;
  LatLng? _pickup;
  LatLng? _destination;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onTap(LatLng latLng) {
    if (_pickup == null) {
      setState(() {
        _pickup = latLng;
      });
    } else if (_destination == null) {
      setState(() {
        _destination = latLng;
        widget.onLocationSelected(_pickup!, _destination!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      onTap: _onTap,
      initialCameraPosition: const CameraPosition(
        target: LatLng(27.65594703211962, 85.32094949667898),
        zoom: 14.4746,
      ),
      markers: {
        if (_pickup != null)
          Marker(
            markerId: const MarkerId('pickup'),
            position: _pickup!,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
          ),
        if (_destination != null)
          Marker(
            markerId: const MarkerId('destination'),
            position: _destination!,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
      },
    );
  }
}

class Dlist extends StatelessWidget {

  const Dlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passenger list')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//Text('Pickup: ${pickup.latitude}, ${pickup.longitude}'),
            const SizedBox(height: 16),
//Text('Destination: ${destination.latitude}, ${destination.longitude}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
// Navigate back to the DriverMap screen
                Navigator.of(context).pop();
              },
              child: const Text('Back to Map'),
            ),
          ],
        ),
      ),
    );
  }
}

// Future<void> _handlePressButton() async {
//   const Mode _mode = Mode.overlay;
  
//  final homeScaffoldKey = GlobalKey<ScaffoldState>();
//     var googleAPIKey="AIzaSyC1e1LEMoEjOqMBF7QiGYMQa6gfwXdGkTk";
//     Future<Prediction?> p = await PlacesAutocomplete.show(
//         context: context,
//         apiKey: googleAPIKey,
//         onError: onError,
//         mode: _mode,
//         language: 'en',
//         strictbounds: false,
//         types: [""],
//         decoration: InputDecoration(
//             hintText: 'Search',
//             focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.white))),
//         components: [Component(Component.country,"pk"),Component(Component.country,"usa")]);


//     displayPrediction(p!,homeScaffoldKey.currentState);
//   }
  // void onError(PlacesAutocompleteResponse response){

  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     elevation: 0,
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     content: AwesomeSnackbarContent(
  //       title: 'Message',
  //       message: response.errorMessage!,
  //       contentType: ContentType.failure,
  //     ),
  //   ));

  //   // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  // }
  //   Future<void> displayPrediction(Prediction p, ScaffoldState? currentState) async {

  //   var googleAPIkey="AIzaSyC1e1LEMoEjOqMBF7QiGYMQa6gfwXdGkTk";
  //   GoogleMapsPlaces places = GoogleMapsPlaces(
  //     apiKey: googleAPIkey,
  //     apiHeaders: await const GoogleApiHeaders().getHeaders()
  //   );

  //   PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

  //   final lat = detail.result.geometry!.location.lat;
  //   final lng = detail.result.geometry!.location.lng;

  //   markersList.clear();
  //   markersList.add(Marker(markerId: const MarkerId("0"),position: LatLng(lat, lng),infoWindow: InfoWindow(title: detail.result.name)));

  //   setState(() {});

     
  //    late GoogleMapController googleMapController;
  //    googleMapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));

  // }