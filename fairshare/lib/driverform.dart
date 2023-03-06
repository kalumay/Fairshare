// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print, use_build_context_synchronously

//import 'dart:js';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Define a variable to hold the selected image
// ignore: unused_element
//File? _imageFile;

// Define a function to launch the image picker
// ignore: unused_element


class DriverForm extends StatefulWidget {
  const DriverForm({required Key key}) : super(key: key);
  

  @override
  State<DriverForm> createState() => _DriverFormState();
}

class _DriverFormState extends State<DriverForm> {
  TextEditingController vname = TextEditingController();
  TextEditingController licenseNumber = TextEditingController();
  TextEditingController nPlate = TextEditingController();
  
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
                         controller: vname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                        // validator:(Stringmsg) {
                        // },
                        decoration: InputDecoration(
                          labelText: "Vehicle",
                          hintText: "Type of vehicle: eg bike",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0)
                          )
                        ),
                      ),
                      
                      ),
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                      child:TextFormField(
                         controller: licenseNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
                         controller: nPlate,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
}
return null;
},
// validator:(Stringmsg) {
// },
decoration: InputDecoration(
labelText: "Number Plate",
hintText: "Enter your vehicle's number plate",
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(1.0)
)
),
),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      child: const Text("Submit")
                    ),
                  ),
                ],
              ),
   ),
  ),
),
);
}

void _submit() async {
final User? user = FirebaseAuth.instance.currentUser;
final uid = user!.uid;
final driverRef = FirebaseFirestore.instance.collection('drivers').doc(uid);
await driverRef.set({
'vehicle_name': vname.text,
'license_number': licenseNumber.text,
'number_plate': nPlate.text,
}).then((value) {
Fluttertoast.showToast(
msg: "Driver details added successfully",
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
backgroundColor: Colors.green,
textColor: Colors.white,
fontSize: 16.0,
);
Navigator.pushReplacementNamed(context, 'drivermap');
}).catchError((error) {
Fluttertoast.showToast(
msg: "Failed to add driver details: $error",
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
backgroundColor: Colors.red,
textColor: Colors.white,
fontSize: 16.0,
);
});
}
}




