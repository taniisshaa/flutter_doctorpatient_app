import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorpatient_app/model/button.dart';
import 'package:doctorpatient_app/patient%20page%20whole/booking_page.dart';
import 'package:doctorpatient_app/doctor%20details/doctor_details1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget{
  const DoctorDetails({super.key});



  @override
  State<DoctorDetails> createState()=> _DoctorDetailsState();


 }






 class _DoctorDetailsState extends State<DoctorDetails>{



   bool isFav = false;
  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
          GestureDetector(
          onTap: () {
    Navigator.pop(context);
    },
            child: CircleAvatar(
              radius: 20,
              child: IconButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>const DoctorDetails1()));
                },
                icon: const Icon(Icons.arrow_forward),
            ),
            ),
      ),
]


    ),
      body:
      SafeArea(
        child:SingleChildScrollView(
          child: Column(
        children: <Widget>[
            const AboutDoctor(),
          const DetailBody(),
       const Padding(padding: EdgeInsets.all(5),),

    Container(

    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),

    color: Colors.cyanAccent,
    ),
    padding: const EdgeInsets.symmetric(
    vertical: 10,horizontal: 10,
    ),
    child: Column(
    children: [


      Button(title: "Book Appointment",

      width: double.infinity, disable: false, onPressed: (){
        String did = "rvPN7NXq4YVDfCgOZRXGQjoPoy32";
        Doctor.func(did);



      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>const BookingPage()));
    },),
       ],
      ),

      ),
      ]
    )
      )
      )
    );
  }
 }
class AboutDoctor extends StatelessWidget{
  const AboutDoctor({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context){

    return
      Container(
      width: double.infinity,
      child: Column(
        children:<Widget> [
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/images/doctor2.png'),
            backgroundColor: Colors.blue,
          ),

            Container(

          child: const Text(
            'Dr.Siddhant',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),),
            ),
          Container(

            child: const Text(
              'MBBS, MD - Medicine, DM - Cardiology. '
                  'He has worked in past at PGI Chandigarh, Escorts Heart Institute , Nagpur, MYH Group Of Hospitals Indore Etc.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),

          ),
          Container(

            child: const Text(
              ' Shalby Hospitals, Indore',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
class  DetailBody extends StatelessWidget{

  const DetailBody({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context){

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          const DoctorInfo(),
      Container(
        margin: const EdgeInsets.only(top: 10),
          child: const Text(
            'About Doctor',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
      ),


      Container(
        margin: const EdgeInsets.only(top: 10),
          child: const Text("Dr Siddhant Jain, DM Cardiology is senior interventional and consultant cardiologist with a rich experience of more than 13 years of patient service. He is born and brought up in Indore & was the state PMT topper. He did his M.B.B.S. from M G M Medical College, Indore & was throughout topper with highest marks in MBBS & 16 gold medals.",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),),
      ),
        ]
      ),
    );
  }
}
class  DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key?key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      children:const <Widget>
      [ InfoCard(label: 'Patients', value: '109',
        ),
    SizedBox(
      width: 15,
    ),
    InfoCard(
    label: 'Experience', value: '17 years',
    ),
        SizedBox(
          width: 15,
        ),
    InfoCard(
    label: 'Rating', value: '4.6',
    ),
        SizedBox(
          width: 15,
        ),
    ],
    );
  }
}
class  InfoCard extends StatelessWidget {
  const InfoCard({Key?key,required this.label, required this.value}) :super(key: key);
         final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.cyanAccent,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30,horizontal: 15,
      ),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),

    );
  }
}



