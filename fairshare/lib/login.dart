
// ignore_for_file: must_be_immutable, avoid_print

import 'package:fairshare/register.dart';
import 'package:fairshare/ridrive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import '../utils/routes.dart';

class Loginpage extends StatelessWidget {
   Loginpage({super.key, required this.context});
   final BuildContext context;
    var otpFieldVisibility = false;
  var receivedID = '';
 String userType = '';
    TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children:  [
           const Text("SignIn with Us",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
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
                    prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      hintText: '9876543210',
                      labelText: 'Phone'),
                ),
              ),
                
                const SizedBox(
                  height: 50.0,
                ),
                ElevatedButton(
                    style:
                        TextButton.styleFrom(minimumSize: const Size(150, 40)),
                    onPressed: () {
                           Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ridrive(),
                    ),
                  );
                    },
                    child: const Text("Login")),
              ],
            ),
          )
        ],
      ),
    );
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
    validateform() {
    if (phoneNumber.text.length != 10) {
      Fluttertoast.showToast(msg: "Please add a valid phone number");
    }
  }

}