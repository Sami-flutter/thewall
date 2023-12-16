import 'package:flutter/material.dart';
import 'package:thewall/pages/components/button.dart';
import 'package:thewall/pages/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main()=>runApp(
const MaterialApp(

));
class RegisterNow extends StatefulWidget {
  final Function()?onTap;
  const RegisterNow({super.key, required this.onTap});

  @override
  State<RegisterNow> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterNow> {
  //create here text fields and then call it down 
  final emailTextcontroler=TextEditingController();
  final passwordTextcontroler = TextEditingController();
  final confirtmTextcontroler = TextEditingController();
  // Show the Loading first 
  void singUp (BuildContext context) async
  {
    showDialog(context: context, 
      builder: (context)=>const Center(
      child: CircularProgressIndicator(),
      ));

      if(passwordTextcontroler.text != confirtmTextcontroler.text){
        //pop loading and show the eror to the user
        Navigator.pop(context);
        //display eror 
        displayMessage('password dont match');
        return;
      }
      //try and creat user
    try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailTextcontroler.text,
    password: passwordTextcontroler.text,
);
if(context.mounted)Navigator.pop(context);
}
  on FirebaseAuthException catch (e) {
  displayMessage(e.code);

      }
  }
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
        backgroundColor: Colors.grey[300],
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
                const Text('Register Now !',
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
                  MyTextField(
                  controller: confirtmTextcontroler, 
                  hintText: 'Confirm Password', 
                  obscureText: true),
                  const SizedBox(height: 25),
                
                //singup button
                MyButton(
                  onTap: (){singUp(context);},
                  text: 'Sign up'),
                const SizedBox(height: 30),
                //goto register button
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text('have an acount ?',
                   style: 
                   TextStyle(
                    color: Color.fromRGBO(97, 97, 97, 1),
                    fontWeight: FontWeight.bold
                    )
                   ,
                   ),
                  GestureDetector(
                  onTap: widget.onTap,
                  child: const Text('  Sign In',
                     style: 
                     TextStyle(
                      color: Color.fromARGB(255, 10, 103, 179),
                      fontWeight: FontWeight.bold
                      ),),
                   )
                   
                ],)
                  ]),
          ),
          ),
        ),
        
      )
    );
  }
}