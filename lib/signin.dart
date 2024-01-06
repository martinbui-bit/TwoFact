import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'dart:math';
import 'package:twofact/success.dart';



class verificationScreen extends StatefulWidget {
  @override
  State<verificationScreen> createState() => _verificationScreenState();
}


class _verificationScreenState extends State<verificationScreen> {

  TextEditingController codeController = TextEditingController();
  String randomNumber = 'X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Verification Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: codeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Code',
                ),
              ),
              ElevatedButton(
                child: const Text('Send Code'),
                onPressed: () {
                  setState(() {
                    randomNumber = Random().nextInt(10001).toString();
                  });
                  print("You're Code is: $randomNumber");
                },
              ),
              ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  setState(() {
                    // print(randomNumber);
                    // print(codeController.text);
                    if(codeController.text == randomNumber)
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => successPage()));
                    }
                    else
                    {
                      print("Incorrect Code or No code was entered");
                    }
                  });

                },
              )
            ],
        ),
      ),
      );
  }
}
