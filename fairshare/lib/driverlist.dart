// ignore_for_file: avoid_print, unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairshare/schedule.dart';
import 'package:flutter/material.dart';

class ScheduleList extends StatefulWidget {
 
  const ScheduleList({Key? key}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  List<Map<String, dynamic>> dataList = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Retrieve the data
  Future<List<Map<String, dynamic>>> retrieveData() async {
    try {
      // Get the documents in the collection
      final QuerySnapshot querySnapshot =
          await _firestore.collection('Rides').get();

      // Iterate through the documents and add the data to a list
      List<Map<String, dynamic>> dataList = [];
      for (final QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        final data = documentSnapshot.data()
            as Map<String, dynamic>; // Cast to Map<String, dynamic>
        data['documentId'] = documentSnapshot.id;
        dataList.add(data);
      }
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
        title: const Text("Schedules"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index >= dataList.length) {
              return null; // Return null if the index is out of range
            }

            final data = dataList[index];
            final scheduleName = data['scheduleName'] ?? '';
            final startAddress = data['startingAddress'] ?? '';
            final destination = data['destinationAddress'] ?? '';

            return SingleChildScrollView(
              child: ListTile(
                title: Text(
                  scheduleName,
                  style: const TextStyle(fontSize: 25),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Schedule Name: ${data['scheduleName']}'),
                    Text('Start Address: ${data['startingAddress']}'),
                    Text('Destination: ${data['destinationAddress']}'),
                    // Text(widget.accept ? 'Accepted' : 'Not accepted'),
                    // add more relevant data to display here if needed
                  ],
                ),
                trailing: Wrap(
                  spacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScheduleRide()));
                      },
                      child: const Text('Edit'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final data = dataList[index];
                        final documentId = data['documentId'];
                        await _firestore
                            .collection('Rides')
                            .doc(documentId)
                            .delete(); // delete document from Firestore
                        dataList.removeAt(index); // remove item from list
                        setState(() {
                          
                        });
                        
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "schedule");
        },
        child: const Text('Add'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void initState() {
    super.initState();
    retrieveData().then((value)  {
      dataList = value;
      setState(() {
        
      });
    });
  }
}
