import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thewall/Auth/register_or_login.dart';
import 'package:thewall/pages/home_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
    body: StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder:(context,snapshot){
    //is the user loged in
    if(snapshot.hasData){
      return const HomePage();
    }
    //is the user not loged in 
    else {
      return const LoginRegister();
    }

    }
    ),
    );
  }
}
