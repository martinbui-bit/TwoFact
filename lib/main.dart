import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:twofact/signin.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TwoFactor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Welcome to my TwoFactor App!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: TextInputWidget(),
    );
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({Key? key}) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final List emails = ["martin.bui@wsu.edu","aaron.stone@wsu.edu"];
  final List passwords = ["Password1", "Password2","Password3"];
  @override


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: TextFormField(
              controller: passwordController,
              // obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            height: 50,
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                if((emails.contains(emailController.text) == true) & (passwords.contains(passwordController.text) == true))
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => verificationScreen()));
                }
                // print(emailController.text);
                // print(emails.contains(emailController.text));
              },
            ),
          ),
        ],
      ),
    );
  }
}

