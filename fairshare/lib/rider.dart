// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, avoid_print

// import 'package:fairshare/Feedback.dart';
// import 'package:fairshare/payment.dart';
// import 'package:fairshare/register.dart';
// import 'package:fairshare/try2.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:tuple/tuple.dart';
// import 'package:place_picker/widgets/place_picker.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/Schedule.dart';
import 'package:flutter/material.dart';
//import 'package:place_picker/place_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'drivermap.dart';

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
  //String? _selectedVehicle = 'Bike';
  //List<String> vehicleType=['Bike','Car'];
  String? selectVehicle;
  @override
  Widget build(BuildContext context) {
    
    //var _onLocationSelected;
    return Scaffold(
      appBar: AppBar(title: const Text('Rider')),
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
            //  ListTile(
            //   title: const Text(
            //     "Payment with Khalti",
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            //   leading: const Icon(Icons.currency_rupee_rounded),
            //   onTap: (){ payWithKhaltiInApp();},
            // ),
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

            //  ListTile(
            //   title: const Text(
            //     "Feedback",
            //     style: TextStyle(
            //       fontSize: 20,
            //     ),
            //   ),
            //   leading: const Icon(Icons.language),
            //   onTap: (){Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const feedback()));},
            // ),
             ElevatedButton(
                        onPressed: () {
                        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DriverMap()));
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
  label: const Text('Search for driver'),
  icon: const Icon(Icons.search),
),
    );
  }
}
