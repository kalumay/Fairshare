//import 'firebase_options.dart';
//import 'package:fairshare/register.dart';
// import 'package:fairshare/otp.dart';
//import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:vehicle_renting_and_sharing/rider.dart';
import 'package:vehicle_renting_and_sharing/ridrive.dart';
import 'package:vehicle_renting_and_sharing/settingpage.dart';
import 'driver.dart';

void main() {
  //    WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp(
  //    //options: DefaultFirebaseOptions.currentPlatform
  //    );
  runApp(MaterialApp(
    initialRoute: 'ridriver',
    debugShowCheckedModeBanner: false,
    routes: {
      'ridriver':(context) => const MyApp(),
      'rider':(context) => const MainDrawer(),
      'setting':(context) => const SettingPage(),
      'driver':(context) => const DriverForm()
    },
  ));
}
