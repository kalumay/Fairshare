import 'package:flutter/material.dart';
import 'package:vehicle_renting_and_sharing/settingpage.dart';
import 'package:getwidget/getwidget.dart';

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
      body:  const Center(child: Text("Driver Form Here",style: TextStyle(fontSize: 45),)),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: Column(
                children: const <Widget>[
                  SizedBox(
                    width: 100,
                    height: 150,
                  )
                ],
              ),
            ),
            const ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.home),
              onTap: null,
            ),
            const ListTile(
              title: Text(
                "Travel history",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.lock_clock_rounded),
              onTap: null,
            ),
            const ListTile(
              title: Text(
                "Intercity",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.language),
              onTap: null,
            ),
            ListTile(
              title: const Text(
                "Active Status",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.how_to_reg_rounded),
              onTap: () {
             
          },
            ),
            GFToggle(
    onChanged: (val){},
    value: true,
 ),
           
            ListTile(
              title: const Text(
                "Setting",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingPage()));
              },
            ),
             ListTile(
              
              title: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
            Navigator.pop(context);
             Navigator.pop(context);
          },
            ),
          ],
        ),
      ),
    );
  }
}