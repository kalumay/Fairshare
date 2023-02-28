import 'package:flutter/cupertino.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '404 Page Not Found',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
