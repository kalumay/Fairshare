// ignore_for_file: unused_import, non_constant_identifier_names, prefer_const_constructors, avoid_print, use_build_context_synchronously, unnecessary_import

//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairshare/auth.dart';
import 'package:fairshare/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

void main() {
  runApp(Register());
}

// ignore: must_be_immutable
class Register extends StatefulWidget {
  //String? verify;

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  var otpFieldVisibility = false;
  var receivedID = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (const Text(
                'Register to share your journey',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),

              //name
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                      labelText: 'Name'),
                ),
              ),

              //phone
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: phoneNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '9876543210',
                      labelText: 'Phone'),
                ),
              ),

              //next
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    validateform();
                    // ignore: await_only_futures
                    await verifyUserPhoneNumber();
                    //verify code till here
                  }, //async
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Register'),
                ),
              ),

              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'phone',
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  validateform() {
    if (name.text.length < 3) {
      Fluttertoast.showToast(msg: "name must be of atleast 3 characters");
    } else if (phoneNumber.text.length != 10) {
      Fluttertoast.showToast(msg: "Please add a valid phone number");
    }
  }

  void _storeData(String userId) async {
    try {
      await FirebaseFirestore.instance.collection('passengerInfo').doc().set({
        'name': name.text,
        'phone': phoneNumber.text,
      });

      Fluttertoast.showToast(msg: "Registration successful!");
      Navigator.pushReplacementNamed(context, 'rider');
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: "Error registering user. Please try again.");
    }
  }

  verifyUserPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: '+977 ${phoneNumber.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
          (value) {
            print('Logged In Successfully');
            Fluttertoast.showToast(msg: "Logged In Successfully");
            final user = value.user;
            if (user == null) {
              return;
            }
            _storeData(user.uid);
          },
        );
        validateform();
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;

        print(receivedID);

        Navigator.pushNamed(
          context,
          'verify',
          arguments: receivedID,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.pushReplacementNamed(context, 'rider');
      }
    });
  }
}
