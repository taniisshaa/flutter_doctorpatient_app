import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../patient page whole/homeScreen1.dart';
import '../patient page whole/stream.dart';
import 'constrants.dart';



class IntroScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(15)),
                  const Text(
                    "Doctor-patient",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Our Care",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  const Text(
                    "Health Care Should be so Simple,fast and uncomplicated ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 4.0,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  user(),
                  const Spacer(),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: Image.asset(
                "assets/images/doctor_PNG16032.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
