// // ignore_for_file: camel_case_types, unused_import, avoid_print, use_build_context_synchronously, library_private_types_in_public_api

// import 'package:fairshare/map.dart';
// import 'package:fairshare/rider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'driverform.dart';
// import 'drivermap.dart';

// class ridrive extends StatefulWidget {
//   const ridrive({Key? key}) : super(key: key);

//   @override
//   _ridriveState createState() => _ridriveState();
// }

// class _ridriveState extends State<ridrive> {
//   @override
//   void initState() {
//     super.initState();
//     FirebaseAuth.instance.authStateChanges().listen((User? user) async {
//       if (user == null) {
//         print('User is currently signed out!');
//       } else {
//         // Retrieve the user's selection from persistent storage
//         final prefs = await SharedPreferences.getInstance();
//         final userType = prefs.getString('userType');

//         // Navigate to the appropriate page based on the user's selection
//         switch (userType) {
//           case 'driver':
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const DriverMap()),
//             );
//             break;
//           case 'rider':
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const Rider()),
//             );
//             break;
//           default:
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const ridrive()),
//             );
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.only(left: 25, right: 25),
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Select the feature you would like to continue with:",
//               style: TextStyle(fontSize: 30),
//               textAlign: TextAlign.center,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: 150,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, 'driver');
//                       },
//                       child: const Text('Driver'),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: 150,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, 'rider');
//                       },
//                       child: const Text('Passenger'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// ignore_for_file: camel_case_types, unused_import, avoid_print, use_build_context_synchronously

import 'package:fairshare/map.dart';
import 'package:fairshare/rider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:vehicle_renting_and_sharing/rider.dart';

import 'driverform.dart';
import 'drivermap.dart';

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
          children: 
          [const Text("Select the feature you would like to continue with:",
          style: TextStyle(fontSize: 30),textAlign:TextAlign.center,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  DriverForm(key: UniqueKey(),)),
            );
                      },
                      child: const Text('Driver'),
                    ),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SizedBox(
                     width: 150,
                height: 50,
                     child: ElevatedButton(
              onPressed: () {
                 Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Rider()),
            );
              },
              child: const Text('Passenger'),
            ),
                   ),
                 ),
              ],
            ),
           
          ],
        ),
      ),
    );
  }
  //  @override
  // void initState() {
  //   super.initState();
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) async {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       // Retrieve the user's selection from persistent storage
  //       final prefs = await SharedPreferences.getInstance();
  //       final userType = prefs.getString('userType');

  //       // Navigate to the appropriate page based on the user's selection
  //       switch (userType) {
  //         case 'driver':
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const DriverMap()),
            // );
  //           break;
  //         case 'rider':
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const Rider()),
            // );
  //           break;
  //         default:
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(builder: (context) => const ridrive()),
  //           );
  //       }
  //     }
  //   });
  // }
}
