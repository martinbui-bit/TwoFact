import 'package:flutter/material.dart';

class successPage extends StatefulWidget {
  const successPage({Key? key}) : super(key: key);

  @override
  State<successPage> createState() => _successPageState();
}

class _successPageState extends State<successPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome!"),
        backgroundColor: Colors.blue,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/thumbsup.jfif'),

          ],
        )
    );
  }
}
