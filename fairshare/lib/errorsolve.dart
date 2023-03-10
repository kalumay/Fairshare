    // return Scaffold(
    //   appBar: AppBar(title: const Text('Driver')),
    //   body: 
    //   //Center(
    //    // child: Stack(
    //       // children: [
    //       //   Maps(onLocationSelected: _onLocationSelected),
    //       //   if (_pickup != null && _destination != null)
    //       //     Positioned(
    //       //       bottom: 0,
    //       //       left: 0,
    //       //       right: 0,
    //       //       child: Container(
    //       //         height: 200,
    //       //         decoration: BoxDecoration(
    //       //           color: Colors.white,
    //       //           borderRadius:
    //       //               const BorderRadius.vertical(top: Radius.circular(20)),
    //       //           boxShadow: [
    //       //             BoxShadow(
    //       //               color: Colors.black.withOpacity(0.1),
    //       //               blurRadius: 10,
    //       //               spreadRadius: 5,
    //       //             ),
    //       //           ],
    //       //         ),
    //       //         child: Column(
    //       //           children: [
    //       //             Padding(
    //       //               padding: const EdgeInsets.all(16),
    //       //               child: Column(
    //       //                 crossAxisAlignment: CrossAxisAlignment.start,
    //       //                 children: [
    //       //                   const Text('Pickup location:'),
    //       //                   Text('${_pickup!.latitude}, ${_pickup!.longitude}'),
    //       //                   const SizedBox(height: 16),
    //       //                   const Text('Destination:'),
    //       //                   Text(
    //       //                       '${_destination!.latitude}, ${_destination!.longitude}'),
    //       //                 ],
    //       //               ),
    //       //             ),
    //       //             ElevatedButton(
    //       //               onPressed: () {
    //       //                 // Navigate to a new page to show the ride details
    //       //                 Navigator.of(context).push(
    //       //                     MaterialPageRoute(builder: (_) => const Dlist()));
    //       //               },
    //       //               child: const Text('Start ride'),
    //       //             ),
    //       //           ],
    //       //         ),
    //       //       ),
    //       //     ),
    //       // ],
    //  //   ),
    //   //),
    //   drawer: Drawer(
    //     child: SizedBox(
    //       height:MediaQuery.of(context).size.height,
    //       child: Column(
    //         children: <Widget>[
    //           Container(
    //             color: Theme.of(context).primaryColor,
    //             width: double.infinity,
    //             child: Column(
    //               children: const <Widget>[
    //                 SizedBox(
    //                   width: 100,
    //                   height: 150,
    //                 )
    //               ],
    //             ),
    //           ),
    //           const ListTile(
    //             title: Text(
    //               "Home",
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //             leading: Icon(Icons.home),
    //             onTap: null,
    //           ),
    //           const ListTile(
    //             title: Text(
    //               "Travel history",
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //             leading: Icon(Icons.lock_clock_rounded),
    //             onTap: null,
    //           ),
    //           Row(
    //             children: [
    //               ListTile(
    //                 title: const Text(
    //                   "Active Status",
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //                 leading: const Icon(Icons.how_to_reg_rounded),
    //                 onTap: () {},
    //               ),
    //               GFToggle(
    //                 onChanged: (val) {},
    //                 value: true,
    //               ),
    //             ],
    //           ),
    //           ListTile(
    //             title: const Text(
    //               "Schedule",
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //             leading: const Icon(Icons.settings),
    //             onTap: () {
    //               Navigator.of(context).pop();
    //               Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) => const ScheduleRide()));
    //             },
    //           ),
    //           ListTile(
    //             title: const Text(
    //               "Logout",
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //             leading: const Icon(Icons.logout),
    //             onTap: () async {
    //               await _auth.signOut();
    //               // ignore: use_build_context_synchronously
    //               Navigator.pushReplacementNamed(context, 'phone');
    //             },
    //           ),
    //           ListTile(
    //             title: const Text(
    //               "Rate this app",
    //               style: TextStyle(
    //                 fontSize: 20,
    //               ),
    //             ),
    //             leading: const Icon(Icons.settings),
    //             onTap: () {
    //               Navigator.of(context).pop();
    //               Navigator.push(context,
    //                   MaterialPageRoute(builder: (context) => const Rate()));
    //             },
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.push(
    //                   context,
    //                   // ignore: prefer_const_constructors
    //                   MaterialPageRoute(builder: (context) => Dlist()));
    //             },
    //             child: const Text('Passenger Mode'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton.extended(
    //     onPressed: () {
    //       showModalBottomSheet(
    //           context: context,
    //           builder: ((context) {
    //             //const Mode _mode = Mode.overlay;
    //             return Material(
    //               child: Column(
    //                 children: <Widget>[
    //                   Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: TextFormField(
    //                         decoration: InputDecoration(
    //                       hintText: " location ",
    //                       labelText: " Your location",
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                       ),
    //                     )),
    //                   ),
                      
    //                   Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: TextFormField(
    //                      // onTap: _handlePressButton,
    //                       decoration: InputDecoration(
    //                         hintText: "Destination",
    //                         labelText: "Enter Destination",
    //                         border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: TextFormField(
    //                       decoration: InputDecoration(
    //                         hintText: "price",
    //                         labelText: " Offer your fare price",
    //                         border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 50.0,
    //                   ),
    //                   Column(
    //                     children: [
    //                       ElevatedButton(
    //                           style: TextButton.styleFrom(
    //                               minimumSize: const Size(30, 50)),
    //                           onPressed: () {
    //                             // _storeData(userId);
    //                             Navigator.pushNamed(context, "drivermap");
    //                           },
    //                           child: const Text(
    //                             "Find a passenger",
    //                             style: TextStyle(
    //                               fontSize: 25,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           )),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             );
    //             // ignore: dead_code
    //             SizedBox(
    //               height: 400,
    //               child: Center(
    //                 child: ElevatedButton(
    //                   child: const Text('close'),
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                 ),
    //               ),
    //             );
    //           }));
    //     },
    //     label: const Text('Search for Passenger'),
    //     icon: const Icon(Icons.search),
    //   ),
    // );