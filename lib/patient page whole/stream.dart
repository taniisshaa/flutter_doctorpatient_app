import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'booking_page.dart';
String tpid = "";
String piname = "";
class user extends StatelessWidget {
  final _usersStream = FirebaseFirestore.instance
      .collection('patient')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            Map<String, dynamic> data =
            snapshot.data!.data()! as Map<String, dynamic>;
            print("*************************************");
            tpid=data["uid"];
            piname=data["name"];
            Patient.func(tpid,piname);

            print(tpid);
            print(piname);
            print("BBBBBBBBBBBBBBBBBBBBBBBBBB");
            print("BBBBBBBBBBBBBBBBBBBBBBBBBBBB");
            print("*************************************");

            return Center();
          },
        ),
      ),
    );
  }
}
