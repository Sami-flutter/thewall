// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
// import 'package:samiirid/Auth/auth.dart';
// import 'package:samiirid/Auth/register_or_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thewall/Auth/auth.dart';
//import 'package:thewall/Auth/register_or_login.dart';
import 'firebase_options.dart';


void main () async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform
);
  runApp(const Myapp());
  
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   // Add more dark theme configurations if needed
      // ),
      home: AuthPage(),
    );
  }
}