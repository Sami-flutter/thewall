import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thewall/pages/components/button.dart';
import 'package:thewall/pages/components/text_field.dart';
void main()=>runApp(
const MaterialApp(

));
class LoginPage extends StatefulWidget {
  final Function()?onTap;
  const LoginPage({super.key, required this.onTap});

 
  
  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  //create here text fields and then call it down 
  final emailTextcontroler=TextEditingController();
  final passwordTextcontroler =TextEditingController();
  //sing funtion
   void signin() async {
    //Show loading method
    showDialog(context: context,
     builder: (context)=>const Center(
     child: CircularProgressIndicator(),
     ));
  try
  {
    await FirebaseAuth.instance.signInWithEmailAndPassword
  (
    email: emailTextcontroler.text, 
    password: passwordTextcontroler.text);
  
  //pop the dialog
  if(context.mounted)  Navigator.pop(context);
  }
  on FirebaseAuthException catch(e){
  //pop loading circle
  //Navigator.pop(context);
  // display error 
  displayMessage(e.code);
  }

  }
  //display error message 
 void displayMessage(String message,) {
  showDialog(
    context: context,
    builder: (context)=>AlertDialog(
    title:Text(message)
    ),   
  );
 }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor:Colors.grey[300],
        body:  SafeArea(
          child: Center(
          
          child:  Padding(
            
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const SizedBox(height: 40),
                //logo
            const  Icon(
              Icons.lock,
              size: 130,
                
                ),
              const  SizedBox(height: 10),
                //welcome text
                const Text('Welcome back !',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
                ),
                 const SizedBox(height: 25),
          
                //textfields
                MyTextField(
                  controller: emailTextcontroler, 
                  hintText: 'Email', 
                  obscureText: false),
                  const SizedBox(height:20),
                   MyTextField(
                  controller: passwordTextcontroler, 
                  hintText: 'Password', 
                  obscureText: true),
                  const SizedBox(height: 25),
                //singup button
                MyButton(onTap: signin, text: 'Sing in'),
                const SizedBox(height: 30),
                //goto register button
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text('Not a Member?',
                   style: 
                   TextStyle(
                    color: Color.fromRGBO(97, 97, 97, 1),
                    fontWeight: FontWeight.bold
                    )
                   ,
                   ),
                  GestureDetector(
                  onTap: widget.onTap,
                     child: const Text('  Register Now',
                     style: 
                     TextStyle(
                      color: Color.fromARGB(255, 10, 103, 179),
                      fontWeight: FontWeight.bold
                      ),),
                   )
                   
                ],),
               
                  ]),
          ),
          ),
        ),
        
      )
    );
  }
}