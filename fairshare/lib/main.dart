import 'package:fairshare/drivermap.dart';
import 'package:fairshare/errorpage.dart';
import 'package:fairshare/login.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/payment.dart';
import 'package:fairshare/rate.dart';
import 'package:fairshare/Schedule.dart';
import 'package:fairshare/ridrive.dart';
import 'package:fairshare/splash.dart';
import 'package:fairshare/try2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'feedback.dart';
import 'firebase_options.dart';
import 'package:fairshare/driverform.dart';
import 'package:fairshare/otp.dart';
import 'package:fairshare/rider.dart';
import 'package:flutter/material.dart';
import 'package:fairshare/register.dart';
Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
     );
     
     
  runApp(MaterialApp(
    
    initialRoute: 'splash',
    onUnknownRoute: (settings) {
  return MaterialPageRoute(builder: (context) => const MyErrorWidget());
},

    debugShowCheckedModeBanner: false,
     
    routes: {
      'splash':(context) => const Splash(),
      'phone':(context) =>  const Register(),
      'login':(context) => const Loginpage(),
      'verify': (context) => MyVerify(
              receivedID: ModalRoute.of(context)?.settings.arguments as String,
            ),
      'ridrive':(context) => const ridrive(),
      'rider':(context) => const Rider(),
      'schedule':(context) => const ScheduleRide(),
      'driver':(context) => DriverForm(key: UniqueKey()),
      'feedback':(context)=> const feedback(),
      'rate':(context) => const Rate(),
      'map':(context) => const MapSample(),
      'buttom':(context) => const ButtomSheet(),
      'drivermap':(context) => const DriverMap(),
      'payment':(context) => const PayPage()
    },
    
  ));
}

