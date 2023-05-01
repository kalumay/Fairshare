// ignore_for_file: avoid_print, unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
//import 'package:fairshare/rider.dart';

class PassengerList extends StatefulWidget {
  // final Function(bool) accept;
  const PassengerList({Key? key}) : super(key: key);

  @override
  State<PassengerList> createState() => _PassengerListState();
}

class _PassengerListState extends State<PassengerList> {
  List<Map<String, dynamic>> dataList = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  LatLng? _pickup;

  LatLng? _destination;

// // Retrieve the data
// Future<List<Map<String, dynamic>>> retrieveData() async {
//   try {
//     // Get the documents in the Rides collection
//     final QuerySnapshot ridesQuerySnapshot =
//         await _firestore.collection('Rides').get();

//     // Iterate through the documents in the Rides collection
//     List<Map<String, dynamic>> dataList = [];
//     for (final QueryDocumentSnapshot ridesDocumentSnapshot
//         in ridesQuerySnapshot.docs) {
//       final ridesData = ridesDocumentSnapshot.data()
//           as Map<String, dynamic>; // Cast to Map<String, dynamic>
//       final userId = ridesData['userId'];

//       // Get the document in the PassengerInfo collection that matches the userId in Rides
//       final QuerySnapshot passengerInfoQuerySnapshot = await _firestore
//           .collection('PassengerInfo')
//           .where('userId', isEqualTo: userId)
//           .get();

//       final passengerInfoData = passengerInfoQuerySnapshot.docs.first.data()
//           as Map<String, dynamic>; // Cast to Map<String, dynamic>

//       // Combine the data from Rides and PassengerInfo
//       final combinedData = {
//         ...ridesData,
//         'documentId': ridesDocumentSnapshot.id,
//         'phone': passengerInfoData['phone'],
//         'name': passengerInfoData['name']
//       };

//       dataList.add(combinedData);
//     }
//     return dataList;
//   } catch (e) {
//     print('Error retrieving data: $e');
//     return [];
//   }
// }

// Retrieve the data
  Future<List<Map<String, dynamic>>> retrieveData() async {
    try {
      // Get the documents in the collection
      final QuerySnapshot querySnapshot =
          await _firestore.collection('Rides').get();

      // Iterate through the documents and add the data to a list
      List<Map<String, dynamic>> dataList = [];

      // for (final ridesDoc in ridesQuerySnapshot.docs) {
      //   final ridesData = ridesDoc.data() as Map<String, dynamic>;
      //   final passengerInfoDoc = await _firestore
      //       .collection('PassengerInfo')
      //       .doc(ridesData['userId'])
      //       .get();
      //   final passengerInfoData =
      //       passengerInfoDoc.data() as Map<String, dynamic>;

      //   final combinedData = {...ridesData, ...passengerInfoData};

      //   dataList.add(combinedData);
      // }
      for (final QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        final data = documentSnapshot.data()
            as Map<String, dynamic>; // Cast to Map<String, dynamic>
        data['documentId'] = documentSnapshot.id;

        // // Retrieve passenger phone number based on userId
        final passengerInfoQuerySnapshot = await _firestore
            .collection('passengerInfo')
            .doc(data['userId'])
            .get();

        final passengerInfoData = passengerInfoQuerySnapshot.data();
        final phone = passengerInfoData!['phone'];

        // Add passenger phone number to the data
        data['passengerPhone'] = passengerInfoData['phone'];

        dataList.add(data);
      }
      return dataList;
    } catch (e, s) {
      print('Error retrieving data: $e $s');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passenger List"),
      ),
      body: SafeArea(
        child: dataList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= dataList.length) {
                    return null; // Return null if the index is out of range
                  }

                  final data = dataList[index];
                  final startAddress = data['startingAddress']?.toString() ??
                      'No start address provided';

                  //final String? scheduleName = data['scheduleName'] ?? '';
                  // final startAddress = data['startingAddress'] ?? 'No start address provided';
                  final String? destination = data['destinationAddress'] ?? '';
                  final time = DateTime.parse(data['time']);
                  final dateFormatted = DateFormat.yMd().format(time);
                  final timeFormatted = DateFormat.jm().format(time);
                  String uid = FirebaseAuth.instance.currentUser!.uid;

                  return SingleChildScrollView(
                    child: ListTile(
                      // title: Text(
                      //   scheduleName,
                      //   style: const TextStyle(fontSize: 25),
                      // ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Address: ${data['startingAddress']}'),
                          Text('Destination: ${data['destinationAddress']}'),
                          Text('Date: $dateFormatted'),
                          Text('Time: $timeFormatted'),
                          Text('Phone: ${data['passengerPhone']}')
                          // add more relevant data to display here if needed
                        ],
                      ),
                      trailing: Wrap(
                        spacing: 12,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>  MapSample( pickup: _pickup == null
                              //                         ? const google.LatLng(0, 0)
                              //                         : google.LatLng(
                              //                             _pickup!.latitude,
                              //                             _pickup!.longitude,
                              //                           ),
                              //                     destination: _destination == null
                              //                         ? const google.LatLng(0, 0)
                              //                         : google.LatLng(
                              //                             _destination!.latitude,
                              //                             _destination!.longitude,
                              //                           ),)
                              //         ),);
                              //accept(true);
                            },
                            child: const Text('Accept'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final data = dataList[index];
                              final documentId = data['documentId'];
                              // await _firestore
                              //     .collection('Rides')
                              //     .doc(documentId)
                              //     .delete(); // delete document from Firestore
                              dataList.removeAt(index); // remove item from list
                              setState(() {});
                            },
                            child: const Text('Decline'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    retrieveData().then((value) {
      setState(() {
        dataList = value;
      });
    });
  }
}
