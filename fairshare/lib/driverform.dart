// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

// ignore_for_file: unused_import, duplicate_ignore

import 'package:fairshare/drivermap.dart';
//import 'package:fairshare/map.dart';
// ignore: unused_import
import 'package:fairshare/rate.dart';
import 'package:fairshare/register.dart';
import 'package:fairshare/schedule.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
// ignore: unused_import
import 'package:image_picker/image_picker.dart';

// Define a variable to hold the selected image
// ignore: unused_element
//File? _imageFile;

// Define a function to launch the image picker
// ignore: unused_element


class DriverForm extends StatefulWidget {
  const DriverForm({super.key});
  

  @override
  State<DriverForm> createState() => _DriverFormState();
}

class _DriverFormState extends State<DriverForm> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver')),
      body:  
      Container( 
        padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
       child: SingleChildScrollView( child: Form(
         // key: _DriverFormKey,
          child: Column(
                    children: <Widget>[
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                      child:TextFormField(
                        // validator:(Stringmsg) {
                        // },
                        decoration: InputDecoration(
                          labelText: "Vehicle",
                          hintText: "Enter the type of Vehicle",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                      ),
                      
                      ),
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                      child:TextFormField(
                        keyboardType: TextInputType.phone,
                        // validator:(Stringmsg) {
                        // },
                        decoration: InputDecoration(
                          labelText: "Licence Number",
                          hintText: "Enter your Licence number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                      ),
                      
                    
                      ),
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                      child:TextFormField(
                        keyboardType: TextInputType.phone,
                        // validator:(Stringmsg) {
                        // },
                        decoration: InputDecoration(
                          labelText: "Number Plate",
                          hintText: "Enter your number Plate",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                      ),
                      
                      ),
                      ElevatedButton(
                        onPressed: () {
                        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DriverMap()));
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
        )
      )
      ),

    );
  }
}