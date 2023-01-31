// ignore: unused_import
import 'package:fairshare/register.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Welcome to Flutter',textAlign: TextAlign.center),
        backgroundColor: Colors.black),
        body: SizedBox(
          width: 411,height: 4700, 
          child: SingleChildScrollView(
          child: Column(children: [( const Text('Register Here', style: TextStyle(fontSize:30), )), 
          Image.asset('assests/scooty.jpg',width: 150,height: 150,),
          
          //name
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter your name'),),
          ),
          
          //phone
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: 'Enter Phone No.'),),
          ),
          
          //next
          ElevatedButton(onPressed: ()
                    {
                      Navigator.pushNamed (context,'verify');
                    },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,), 
                child: const Text('Next',),),
                    Image.asset('assests/screen-shot-2013-11-01-at-2-28-36-pm.png'), 
                    ],
                    )
                    )
        
      )
      )
    ); 
  }
}
