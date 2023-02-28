// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fairshare/register.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
//import 'package:untitled/splash.dart';

void main() {
  runApp(const Splash());
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash:
        Image.asset('assests/icon.jpg',),
        nextScreen: const Register(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Colors.white,
      ),

    );

  }
}
