// ignore_for_file: unused_import

import 'package:fairshare/Feedback.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/payment.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/register.dart';
import 'package:fairshare/Schedule.dart';
import 'package:fairshare/try2.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'drivermap.dart';

//import 'package:vehicle_renting_and_sharing/settingpage.dart';
FirebaseAuth _auth = FirebaseAuth.instance;

class Rider extends StatefulWidget {
  const Rider({super.key});

  @override
  State<Rider> createState() => _RiderState();
}

class _RiderState extends State<Rider> {
  
  String referenceId = "";
  String? _selectedVehicle = 'Bike';
  //List<String> vehicleType=['Bike','Car'];
  String? selectVehicle;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Rider')),
      // ignore: prefer_const_constructors
      body:   Center(
      child: Stack(
       
          children:  const [MapSample(), 
        
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
              return Material(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: " location ",
                        labelText: " Your location",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Destination",
                        labelText: "Enter Destination",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "price",
                        labelText: " Offer your fare price",
                      ),
                    ),
                    
                   //String?selectVehicle;

Row(
  children: [
     const Text("Choose the vehicle:"),
DropdownButton<String>(
  value: _selectedVehicle,
  onChanged: (String? newValue) {
    setState(() {
        _selectedVehicle = newValue;
    });
  },
  items: <String>['Bike','Car' ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
    );
  }).toList(),
),
  ],
),
  //////////////////test puposeeee///////////////////////////////////////////////
 
//////////////////////////////////////testtest////////////////////////////////////////
                    const SizedBox(
                      height: 50.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            style: TextButton.styleFrom(
                                minimumSize: const Size(100, 80)),
                            onPressed: () {
                              //Navigator.pushNamed(context, MyRoutes.homeRoute);
                            },
                            child: const Text(
                              "Find a Driver",
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
            })
    );
  },
  label: const Text('Search for driver'),
  icon: const Icon(Icons.search),
),
    );
  }
}
//   payWithKhaltiInApp() {
//     KhaltiScope.of(context).pay(
//       config: PaymentConfig(
//         amount: 1000, //in paisa
//         productIdentity: 'Product Id',
//         productName: 'Product Name',
//         mobileReadOnly: false,
//       ),
//       preferences: [
//         PaymentPreference.,

//       ],
//       onSuccess: onSuccess,
//       onFailure: onFailure,
//       onCancel: onCancel,
//     );
//   }

//   void onSuccess(PaymentSuccessModel success) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Payment Successful'),

//           actions: [
//             SimpleDialogOption(
//                 child: const Text('OK'),
//                 onPressed: () {
//                   setState(() {
//                     referenceId = success.idx;
//                   });

//                   Navigator.pop(context);
//                 })
//           ],
//         );
//       },
//     );
//   }

//   void onFailure(PaymentFailureModel failure) {
//     debugPrint(
//       failure.toString(),
//     );
//   }

//   void onCancel() {
//     debugPrint('Cancelled');
//   }



