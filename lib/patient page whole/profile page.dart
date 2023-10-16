


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Profile extends StatefulWidget{
  const  Profile ({Key?key}): super(key: key);


  @override
  State< Profile> createState()=> _ProfileState();

}

class _ProfileState extends State< Profile> {


  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(


        backgroundColor: Colors.blue,
      appBar: AppBar(
        title:

         const Text("Profile",
           style: TextStyle(

            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body:
      Container(

        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("patient").where("uid",
              isEqualTo: currentUser.currentUser?.uid).snapshots(),

          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
          {
            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data!.docs.length,
                shrinkWrap: true, itemBuilder: (context,i)=>
                    Padding(
                  padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(




              child:   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              Padding(padding: EdgeInsets.only(top: 70)),
                Icon(Icons.person,
                size: 70,
                  color: Colors.black,
                ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Text(snapshot.data!.docs[i]['name'],
                 style: const TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                 ),),
                    ),


              const Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                  child: Text(snapshot.data!.docs[i]['email'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )
              ),

            ],
            ),
            ),
                ),
         );
            }else{
              return const CircularProgressIndicator();
            }
          },

        ),
            ),
    );



  }
}



