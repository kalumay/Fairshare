// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables

import 'package:fairshare/drivermap.dart';
import 'package:fairshare/errorpage.dart';
import 'package:fairshare/home.dart';
import 'package:fairshare/login.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/Schedule.dart';
import 'package:fairshare/ridrive.dart';
import 'package:fairshare/splash.dart';
import 'package:fairshare/trylocation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fairshare/driverform.dart';
import 'package:fairshare/otp.dart';
import 'package:fairshare/driverlist.dart';
import 'package:fairshare/rider.dart';
import 'package:flutter/material.dart';
import 'package:fairshare/register.dart';

Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
     );
     
    

final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  var onSearch;
  runApp(MaterialApp(
    
    initialRoute: 'splash',
    onUnknownRoute: (settings) {
  return MaterialPageRoute(builder: (context) => const MyErrorWidget());
},

    debugShowCheckedModeBanner: false,
      
    routes: {
      'splash':(context) => const Splash(),
      'phone':(context) =>  const Register(),
      'login':(context) =>  Loginpage(context: context,),
      'verify': (context) => MyVerify(
              receivedID: ModalRoute.of(context)?.settings.arguments as String,
            ),
      'ridrive':(context) => const ridrive(),
      'rider':(context) => const Rider(),
      'schedule':(context) => const ScheduleRide(),
      'driver':(context) => DriverForm(key: UniqueKey()),
      'rate':(context) => const Rate(),
      'map':(context) =>  MapSample(onLocationSelected: (_pickupLatLng, destinationLatLng ) {  },),
      'drivermap':(context) => const DriverMap(),
      'schedulelist':(context) => ScheduleList(),
      'homes':(context) => Homes(userId: user!.uid),
      'search':(context) => Searches(onSearch: onSearch)
    },
    
  ));
}

