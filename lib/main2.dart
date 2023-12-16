import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Sami(),
 
));

class  Sami extends StatelessWidget {
  const Sami({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
    backgroundColor:  Colors.grey[900],
    appBar:  AppBar(
    title: const  Text('sami Id card'),
    centerTitle: true,
    backgroundColor:  Colors.grey[850],
    elevation: 0.0,
    ),
    
    body: const Padding (
    padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
    CircleAvatar(
      backgroundImage:AssetImage('assets/alta.jpg'),
      radius: 40.0,
    ) ,
    SizedBox(height: 30.0,),
      Text(
        'Name',
        style: TextStyle(
        color: Colors.grey,
        letterSpacing: 2.0,
        
        ),
      ),
      SizedBox(height: 10.0,),
    Text(
        'Chun-Li',
        style: TextStyle(
        color: Color.fromARGB(255, 225, 181, 24),
        letterSpacing: 2.0,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        
        ),
      ),
       SizedBox(height: 30.0,),
       Text(
        'Curent Level Sami',
        style: TextStyle(
        color: Colors.grey,
        letterSpacing: 2.0,
        
        ),
      ),
      SizedBox(height: 10.0,),
    Text(
        ' 8',
        style: TextStyle(
        color: Color.fromARGB(255, 225, 181, 24),
        letterSpacing: 2.0,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        
        ),
      ),
      SizedBox(height: 30.0,),
     Row(
      
      children: <Widget>
      [
        Icon(
          Icons.email,
          color: Colors.grey,
        ),
         SizedBox(height: 10.0,),
        Text(
        
          '  sami@gmail.com',
          style: TextStyle(
          color:  Colors.grey,
          fontSize: 18,
          letterSpacing: 1.0

          ),
        )
        
      ],
     )  
    ],
    
    ),
    
    ),    
    

    );
  }
}
