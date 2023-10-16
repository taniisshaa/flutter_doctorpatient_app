import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorpatient_app/loginpage/Start.dart';
import 'package:doctorpatient_app/patient%20page%20whole/booking_page.dart';
import 'package:doctorpatient_app/patient%20page%20whole/profile%20page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../doctor details/doctor_details.dart';

String Ofline = "Offline";


class HomeScreen1 extends StatefulWidget{
  const HomeScreen1({super.key});



  @override
  State<HomeScreen1> createState() => _HomeScreen1();

}


class _HomeScreen1  extends State<HomeScreen1> with WidgetsBindingObserver{

  late Map<String,dynamic>userMap;
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance;


@override
void initState() {



  WidgetsBinding.instance.addObserver(this);
  super.initState();

}

void setStatus(String status)async{

  await _firestore.collection("patient").doc(auth.currentUser?.uid).update({

    "status":status,
  });
  patientOnline(status);

}
@override
void  didChangeAppLifecycleState(AppLifecycleState state){

  if(state == AppLifecycleState.resumed){
    //online
    setStatus("online");

    print("onlineeee***********");
  }else{
    //offline
setStatus("offline");

  }
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

    Size size = MediaQuery.of(context).size;

    return  Scaffold(


      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(

        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,

        centerTitle: true,



        actions: [
          GestureDetector(

            child: Container(
              margin: const EdgeInsets.only(right: 10),

              child: const Icon(
            Icons.notifications_rounded,
            color: Colors.white,
          ),
          ),
          ),
          GestureDetector(

              child: Container(
                margin: const EdgeInsets.only(right: 10),
               child: Image.asset("assets/images/lc.jpg"),

                ),
              )
        ],
      ),


      drawer: Drawer(
        child:Container(
            color: Colors.lightBlueAccent,
            child:SafeArea(
              child: Column
                (children: [
                  const Padding(padding: EdgeInsets.all(15)),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("patient").where("uid",
                      isEqualTo: currentUser.currentUser?.uid).snapshots(),

                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
                  {
                    if(snapshot.hasData){
                      return ListView.builder(itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true, itemBuilder: (context,i) {


                          var data = snapshot.data!.docs[i];

                          return UserAccountsDrawerHeader(accountName: Text(data["name"]),

                              accountEmail: Text(data["email"]));

                        },
                      );
                    }else{
                      return const CircularProgressIndicator();
                    }
                  },

                ),
                ListTile(
                  leading: const Icon(Icons.person,color: Colors.black,
                  ),
                  title:ElevatedButton( onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Profile()));
                  }, child: const Text("Profile",
                    style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                ListTile(
                  leading: const Icon(Icons.medical_services_rounded,color: Colors.black,
                  ),
                  title:ElevatedButton( onPressed: () {

                  }, child: const Text("About App",
                    style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                ListTile(
                  leading: const Icon(Icons.local_hospital_sharp,color: Colors.black,
                  ),
                  title:ElevatedButton( onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen1()));
                  }, child: const Text("See All Doctors",
                    style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                ListTile(
                  leading: const Icon(Icons.logout,color: Colors.black,
                  ),
                  title:ElevatedButton( onPressed: () {
                    FirebaseAuth.instance.signOut();

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Start()));
                  }, child: const Text("Logout",
                    style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),),
                ),

              ],),
            )
        ),
      ),


      body:

      Container(

        decoration:const BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )
        ),
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                "Hii",
                    style:TextStyle(
                      color: Color(0xff363636),
                      fontSize: 25,
                    )
              ),
            ),

            Container(

              margin: const EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                  "Welcome",
                  style:TextStyle(
                    color: Color(0xff363636),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SourceSansPro'
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25, left: 20,right: 20),
              decoration: BoxDecoration(
                color: CupertinoColors.activeBlue,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    // ignore: use_full_hex_values_for_flutter_colors
                    color: Colors.blueAccent,
                    offset: Offset(0,10),
                    blurRadius: 15,
                    spreadRadius: 0,
                  )
                ]
              ),
              height: 60,
              width: size.width,
              child: Row(
                children: [
                  IconButton( onPressed: () {

                  }, icon: const Icon(Icons.search),),
                  Expanded(



                    child: TextField(
                  onChanged: (search){

            },decoration: const InputDecoration(
              hintText: "Search",
              contentPadding: EdgeInsets.all(12),
              hintStyle: TextStyle(

              ),
                border: InputBorder.none,
              fillColor: Colors.transparent,

            ),
              ),


                  )
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.only(top: 20,left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20,top: 1),
                    child:const Align(
                      alignment: Alignment.centerRight,
                    child: Text(
                      "Show all",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ),
                ],
              ),

            ),
            Container(
              margin: const EdgeInsets.only(top: 20,left: 20),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoCategories("assets/images/tooth.png","Tooth","10 Doctors"),
                  demoCategories("assets/images/brain.png","Brain","15 Doctors"),
                  demoCategories("assets/images/heart.png","Heart","16 Doctors"),
                  demoCategories("assets/images/bone.png","Bone","18 Doctors"),
                ],
              ),
            ),

            Container(
              width: size.width,
              margin: const EdgeInsets.only(top: 20,left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [

                  const Text(
                    "Category",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20,top: 1),
                    child:const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Top Rated",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      Expanded(

                child:StreamBuilder(

                  stream: FirebaseFirestore.instance.collection('doctors').
                  snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index)=> Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: Container(
                             width: 80,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),


                            child: Row( children: [

                              Container(
                                padding: const EdgeInsets.all(15),

                                width: 230,

                                child:

                                TextButton( onPressed: () {
                                  String did="";
                                  did=snapshot.data!.docs[index]['uid'];
                                  Doctor.func(did);



                                  Navigator.push( context,MaterialPageRoute(builder:
                                      (context) =>const BookingPage(),


                                  )

                                  );
                                },

                                  child: Text(snapshot.data!.docs[index]['name'],



                                  ),




                                ),


                              ),


                              const Padding(padding: EdgeInsets.all(15)),
                              Text(snapshot.data!.docs[index]['Specilization'],

                              ),
Padding(padding: EdgeInsets.only(top: 10)),
                             SizedBox(height: 15,),
                             Expanded(
                               flex: 1,

                               child:
                               ListView(children:<Widget>[

                                 Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10)),
                                 Text(snapshot.data!.docs[index]['status'],style: TextStyle(
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,

                                 ),),
                               ])),








                            ]
                          ),
                        ),
                      ));

                    } else {
                      return Container();
                    }
                  },
                ),
            ),
          ],
      ),
      ),
      );

      }

 Widget demoCategories(
     String image, String name,String drQuality,) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 100,
      decoration: BoxDecoration(
        // ignore: use_full_hex_values_for_flutter_colors
        color: const Color(0xff1071613),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          Container(
            margin: const EdgeInsets.only(
                top: 10),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'SourceSansPro'
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: const Color(0xffd9fffa).withOpacity(.07)
            ),
            child: Text(
              drQuality,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontFamily: 'SourceSansPro'
              ),
            ),
          )
        ]
      ),
    );
 }

 Widget demoTopRatedDr(String image, String name, String speciality,String rating){
    Size size=MediaQuery.of(context).size;

    return GestureDetector(

    onTap: () {

      Navigator.push( context,MaterialPageRoute(builder: (context) =>const DoctorDetails()));
    },

      child: Container(
        height: 90,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),

        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              margin: const EdgeInsets.only(left: 15),
              height: 50,
              width: 60,
              child: Image.asset(image),

            ),

            Container(
              margin: const EdgeInsets.only(left: 20,top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xff363636),
                        fontSize: 17,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Text(
                            speciality,
                            style: const TextStyle(
                              color: Color(0xffababab),
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3,left: size.width*0.25),
                          child: Row(
                            children: [
                              const Text(
                                "Rating",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                    fontFamily: 'SourceSansPro'
                                ),
                              ),
                              Text(
                                rating,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'SourceSansPro'
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
 }

 }
