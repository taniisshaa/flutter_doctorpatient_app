import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:doctorpatient_app/doctor%20whole%20page/datafetch.dart';
import 'package:doctorpatient_app/doctor%20whole%20page/profile.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import '../loginpage/Start.dart';







class AppointmentChecked extends StatefulWidget {
  const AppointmentChecked({Key? key}) : super(key: key);

  @override
  State<AppointmentChecked> createState() => _AppointmentCheckedState();


}


class _AppointmentCheckedState extends State<AppointmentChecked> with WidgetsBindingObserver {



  DatabaseReference ref = FirebaseDatabase.instance.ref();
  var db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final currentUser = FirebaseAuth.instance;
  final firebaseRef = FirebaseDatabase.instance.ref().child("patient");
bool isSwitched=false;
  @override
  void initState() {


    super.initState;
    WidgetsBinding.instance.addObserver(this);

  }

  void setStatus(String status)async{

    await _firestore.collection("doctors").doc(auth.currentUser?.uid).update({

      "status":status,
    });
    patientOnline(status);

  }
  void patientOnline(String onof)async{
    FirebaseDatabase database = FirebaseDatabase.instance;
    final check = currentUser.currentUser?.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("onlineOfline/$check");

    await ref.set({
      "Status" : onof,
    });


  }



  @override
  Widget build(BuildContext context) {
    print("&@&@&&##*@*#******");
   final docid=currentUser.currentUser?.uid;
print(docid.toString());
    print("&@&@&&##*@*#******");
    Apdoc.func(docid.toString());


    return
      Scaffold(

      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(

        title: const Text(
          "Appointment Booked patients",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,

            fontSize: 20,
          ),
        ),

      ),


      drawer: Drawer(
        child: Container(
            color: Colors.lightBlueAccent,
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("doctors")
                        .where("uid", isEqualTo: currentUser.currentUser?.uid)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            var data = snapshot.data!.docs[i];

                            return UserAccountsDrawerHeader(
                                accountName: Text(data["name"]),
                                accountEmail: Text(data["email"])



                            );

                          },
                        );
                      } else {
                        return  CircularProgressIndicator();
                      }
                    },
                  ),

                  ListTile(

                    title:  CustomSwitch(
                      
                      value:isSwitched ,
                      activeColor: Colors.green,
                      onChanged: (value){
                        print("value: $value");
                        setState(() {
                          isSwitched=value;


                        });
                        if(value==true){
                          setStatus("Online");
                        }
                        if(value==false){
                          setStatus("Offline");
                        }


                      },

                    ),


                  ),

                  const Padding(padding: EdgeInsets.all(15)),
                  ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile1()));
                      },
                      child: const Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  ListTile(
                    leading: const Icon(
                      Icons.medical_services_rounded,
                      color: Colors.black,
                    ),
                    title: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "About App",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),


                  const Padding(padding: EdgeInsets.all(15)),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    title: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Start()));
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),

                ],
              ),


            )),
      ),

      body:


        FetchData(),










    );


  }

  }

