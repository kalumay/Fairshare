import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/rider.dart';
import 'package:fairshare/schedule.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class DriverMap extends StatefulWidget {
  const DriverMap({super.key});

  @override
  State<DriverMap> createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  // TextEditingController _locationController = TextEditingController();
  // TextEditingController _destinationController = TextEditingController();
  // TextEditingController _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver')),
      // ignore: prefer_const_constructors
      body:   Center(
      child: Stack( 
          children:  const [MapSample(), ],
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
            ListTile(
              title: const Text(
                "Active Status",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.how_to_reg_rounded),
              onTap: () {
             
          },
            ),
            GFToggle(
    onChanged: (val){},
    value: true,
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
       
       floatingActionButton: FloatingActionButton.extended(
  onPressed: () {
    showModalBottomSheet(
       context: context,
           
            builder: ((context) {
              return Material(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                           hintText: " location ",
                          labelText: " Your location",
                         border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration:InputDecoration(
                          hintText: "Destination",
                          labelText: "Enter Destination",
                           border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration:InputDecoration(
                          hintText: "price",
                          labelText: " Offer your fare price",
                           border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),),
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
                                minimumSize: const Size(30, 50)
                                ),
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
            })
    );
  },
  label: const Text('Search for Passenger'),
  icon: const Icon(Icons.search),
),
    );
  }
//  void _storeData(String userId) async {
//   try {
//     DocumentReference docRef = FirebaseFirestore.instance
//         .collection('rideOffers')
//         .doc(userId);

//     await docRef.set({
//       'location': _locationController.text,
//       'destination': _destinationController.text,
//       'price': _priceController.text,
//       'driverId': userId,
//       'status': 'Pending',
//     });

//     Fluttertoast.showToast(
//         msg: "Data stored successfully!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   } catch (e) {
//     Fluttertoast.showToast(
//         msg: "Failed to store data: $e",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
// }

}