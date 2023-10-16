 import 'package:flutter/material.dart';
import '../model/button.dart';

class  AppointmentBooked extends StatelessWidget {
  const AppointmentBooked ({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Image.asset("assets/images/ml.gif"),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                "Successfully Booked",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Spacer(),
            Padding(padding: 
            const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Button(
              width: double.infinity,
              title: 'Back to Home Page',
              disable: false,
              onPressed: () => Navigator.of(context).pushNamed("main"),
            ),),
          ],
        ),
      ),
    );
  }
}
