
import 'package:fairshare/ridrive.dart';
import 'package:flutter/material.dart';

//import '../utils/routes.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children:  [
           const Text("SignIn with Us",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      'assests/th (1).jpeg',
                      cacheHeight: 150,
                      cacheWidth: 150,
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Image.asset(
                      'assests/th.jpeg',
                      cacheHeight: 150,
                      cacheWidth: 150,
                  ),
                   ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter password",
                    labelText: "password",
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
}