// ignore_for_file: avoid_print, unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairshare/driverlist.dart';
import 'package:fairshare/map.dart';
import 'package:fairshare/rider.dart';
import 'package:fairshare/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
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
 
  // Retrieve the data
Future<List<Map<String, dynamic>>> retrieveData() async {
  try {
    final QuerySnapshot querySnapshot =
        await _firestore.collection('Rides').get();

    // Assign retrieved data to existing variable instead of redeclaring it
List<Map<String, dynamic>> dataList = querySnapshot.docs.map((doc) {
  final data = doc.data() as Map<String, dynamic>;
  data['documentId'] = doc.id;
  return data;
}).toList();




    return dataList;
  } catch (e) {
    print('Error retrieving data: $e');
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
            :ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index >= dataList.length) {
              return null; // Return null if the index is out of range
            }

            final data = dataList[index];
            //final scheduleName = data['scheduleName'] ?? '';
            final startAddress = data['startingAddress'] ?? 'No start address provided';
            final destination = data['destinationAddress'] ?? 'No destination address provided';
            final time = DateTime.parse(data['time']);
            final dateFormatted = DateFormat.yMd().format(time);
            final timeFormatted = DateFormat.jm().format(time);

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
                    //Text('Schedule Name: ${data['scheduleName']}'),
                    Text('Start Address: ${data['startingAddress']}'),
                    Text('Destination: ${data['destinationAddress']}'),
                    Text('Date: $dateFormatted'),
                    Text('Time: $timeFormatted'),
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
      // floatingActionButton: ElevatedButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, "schedule");
      //   },
      //   child: const Text('Add'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
