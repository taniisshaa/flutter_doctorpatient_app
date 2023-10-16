import 'package:doctorpatient_app/loginpage/authpage.dart';
import 'package:doctorpatient_app/loginpage/authpage2.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}
class _StartState extends State<Start> {

  @override
  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Colors.lightBlue.shade200,
      body:

      Column(
        children: <Widget>
        [
          Padding(padding: EdgeInsets.all(60)),
          const SizedBox(
            height: 40,
          ),
         CircleAvatar(
           radius: 40,
           backgroundImage: AssetImage('assets/images/doctor3.png'),
             backgroundColor: Colors.blue,
         ),
          const SizedBox(
            height: 10,
          ),
           Padding(padding: EdgeInsets.only(top: 20)),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => AuthPage2()));
          }, child: const Text(
            "Login  as  Doctor",
            style:TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Pacifico',
            ),
          ),
          ),
       Padding(padding: EdgeInsets.only(top: 60),),
          const SizedBox(
            height: 10,
          ),
          Align(alignment: Alignment.center,),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/images/man.png"),
            backgroundColor: Colors.cyanAccent,
          ),
          Padding(padding:EdgeInsets.only(top: 20) ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => AuthPage()));
          }, child: const Text(
            "Login  as  Patient",
            style:TextStyle(

              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
              fontSize: 25,
            ),
          ),
          ),
        ],
      ),
    );
  }
}