import 'package:flutter/material.dart';
import '../model/button.dart';
import '../patient page whole/booking_page.dart';
import '../doctor details/doctor_details.dart';
class DoctorDetails2 extends StatefulWidget{
  const DoctorDetails2 ({Key?key}): super(key: key);

  @override
  _DoctorDetailsState2 createState()=> _DoctorDetailsState2();

}

class _DoctorDetailsState2 extends State<DoctorDetails2>{
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
              child: Icon(
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

                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),

            ],
        ),
        body: SafeArea(child: Column(
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
                    Button(width: double.infinity, title: "Book Appointment", disable: false, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>const BookingPage()));
                    },),
                  ],
                ),

              ),
            ],
        ),
        ),
    );
  }
}
class AboutDoctor extends StatelessWidget{
  const AboutDoctor({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context){

    return Container(
      width: double.infinity,
      child: Column(
        children:<Widget> [
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/images/bone surgun.jpg'),
            backgroundColor: Colors.blue,
          ),
          Container(

            child: const Text(
              'Dr.Divyanshu Goyal',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),),
          ),
          Container(

            child: const Text(
              'MBBS - Seth G. S. Medical College, KEM hospital Mumbai - 2009',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),

          ),
          Container(

            child: const Text(
              ' Sng Hospitals, Indore',
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
                'Aboout Doctor',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text('Dr. Divyanshu Goyal admission in KEM Hospital, Mumbai for his MBBS in 2003. Got distinction in 6 subjects during the course of his MBBS. Got admission in MS Orthopaedics in 2010 and cleared the exams with merit. He worked for a year in KEM Hospital (his alma mater), Mumbai for a year .',
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
      [ InfoCard(label: 'Patiens', value: '125',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Experience', value: '14 years',
        ),
        SizedBox(
          width: 15,
        ),
        InfoCard(
          label: 'Rating', value: '5.0',
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
class  InfoCard extends StatelessWidget {
  const InfoCard({Key?key, required this.label, required this.value})
      :super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.cyanAccent,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 30, horizontal: 15,
      ),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            value,
            style: TextStyle(
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