// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

//import 'dart:js';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _licenseImageFile;
  File? _numberPlateImageFile;

  
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
                          labelText: "Vehicle Type",
                          hintText: "Bike/Car",
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
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [const Text("License Photo:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ElevatedButton(
        onPressed: _pickLicenseImage,
        child: const Text("Upload"),
      ),
    ],
  ),
),
Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [const Text("Number Plate Photo:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
      ElevatedButton(
        onPressed: _pickNumberPlateImage,
        child: const Text("Upload"),
      ),
    ],
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
Future<void> _pickLicenseImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _licenseImageFile = File(image!.path);
    });
  }

  Future<void> _pickNumberPlateImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _numberPlateImageFile = File(image!.path);
    });
  }

void _submit() async {
final User? user = FirebaseAuth.instance.currentUser;
final uid = user!.uid;
final driverRef = FirebaseFirestore.instance.collection('drivers').doc(uid);
// Upload License Photo
    if (_licenseImageFile != null) {
      final licenseImageRef =
          FirebaseStorage.instance.ref().child('licenses/$uid.jpg');
      await licenseImageRef.putFile(_licenseImageFile!);
      final String licenseImageUrl = await licenseImageRef.getDownloadURL();
      await driverRef.update({'license_image_url': licenseImageUrl});
    }
     // Upload Number Plate Photo
    if (_numberPlateImageFile != null) {
      final numberPlateImageRef =
          FirebaseStorage.instance.ref().child('number_plates/$uid.jpg');
      await numberPlateImageRef.putFile(_numberPlateImageFile!);
      final String numberPlateImageUrl =
          await numberPlateImageRef.getDownloadURL();
      await driverRef.update({'number_plate_image_url': numberPlateImageUrl});
    }
    // Update driver details
await driverRef.set({
'vehicle_name': vname.text,
'license_number': licenseNumber.text,
'number_plate': nPlate.text,
//'License_photo': l
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




