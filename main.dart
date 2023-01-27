import 'package:fairshare/driver.dart';
import 'package:fairshare/otp.dart';
import 'package:fairshare/rider.dart';
import 'package:flutter/material.dart';
import 'package:fairshare/register.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone':(context) => const MyApp(),
      'verify':(context) => const MyVerify(),
      'rider':(context) => const RiderForm(),
      'driver':(context) => const DriverForm()
    },
  ));
}