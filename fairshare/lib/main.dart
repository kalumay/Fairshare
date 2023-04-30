// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables

import 'package:fairshare/drivermap.dart';
import 'package:fairshare/errorpage.dart';
import 'package:fairshare/home.dart';
import 'package:fairshare/login.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/Schedule.dart';
import 'package:fairshare/ridrive.dart';
import 'package:fairshare/splash.dart';
import 'package:fairshare/trylocation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:location/location.dart';
import 'package:open_location_picker/open_location_picker.dart';
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
  final location=Location();

  runApp(OpenMapSettings(
      onError: (context, error) {},
      getCurrentLocation: () async{

bool _serviceEnabled;
PermissionStatus _permissionGranted;


_serviceEnabled = await location.serviceEnabled();
if (!_serviceEnabled) {
  _serviceEnabled = await location.requestService();
  if (!_serviceEnabled) {
    return null;
  }
}

_permissionGranted = await location.hasPermission();
if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
    return null;
  }
}

 final locationData= await location.getLocation();
 if (locationData.latitude == null) return null;


 return LatLng(locationData.latitude!, locationData.longitude!);
      },
      getLocationStream: () => location.onLocationChanged.map((event) => LatLng(event.latitude!, event.longitude!)),
      reverseZoom: ReverseZoom.suburb,
    child: MaterialApp(
      
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
        'drivermap':(context) => const DriverMap(),
        'schedulelist':(context) =>  ScheduleList(accept: true,),
        'homes':(context) => Homes(userId: user!.uid),
        'search':(context) => Searches(onSearch: onSearch)
      },
      
    ),
  ));
}

