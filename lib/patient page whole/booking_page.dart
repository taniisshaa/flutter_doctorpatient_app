

// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorpatient_app/patient%20page%20whole/success_booked.dart';
import 'package:firebase_database/firebase_database.dart';
import'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../model/button.dart';
String pid = "";
String eid = "";
String name = "";


class Doctor {
  static func(String did) {

    eid= did;
  }

}
class Patient{
  static func(String tpid,String piname){
    pid=tpid;
   name=piname;

  }
}
class PatientDatabase{


  static PatientRealtime(String repid, final patientname, String apDate,String ApTime) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    repid=pid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("$eid/$repid");
print("AAAAAAAAAAAAAAAAAAAAAAAAA");
print(patientname);
print(repid);
print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");

    await ref.set({
      "name": patientname,
      "docid": eid,
      "date": apDate,
      "time": ApTime,
    });
  }
}

class BookingPage extends StatefulWidget{
  const BookingPage ({Key?key}): super(key: key);

  @override


  State<BookingPage> createState()=> _BookingPageState();

}


class _BookingPageState extends State<BookingPage>{

  CollectionReference ref = FirebaseFirestore.instance.collection('Appointment');
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      body: CustomScrollView(
          slivers: [
    SliverToBoxAdapter(
      child: Column(
    children: <Widget>[
     _tableCalender(),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
      child: Center(
        child: Text(
          'Select Consulation Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      ),
  ],
),
    ),
    _isWeekend? const SliverToBoxAdapter(

    )
    :  SliverGrid(
         delegate:SliverChildBuilderDelegate((context,index){
           return InkWell(
           splashColor: Colors.transparent,
           onTap: (){
             setState(() {
               _currentIndex = index;
               _timeSelected = true;

             }
             );
           },
    child: Container(
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
    border: Border.all(
    color: _currentIndex == index
    ? Colors.white
    : Colors.black,
    ),
      borderRadius: BorderRadius.circular(5),
      color: _currentIndex == index
          ? Colors.cyan
          :null,
    ),
      alignment: Alignment.center,
      child: Text(
        '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: _currentIndex == index ? Colors.white : null,
      ),
      ),
      ),
    );
    },
           childCount: 8,
        ),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
        childAspectRatio: 1.5
        ),
    ),
    SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
       child: Button(
    width: double.infinity,
    title:'Make Appointment',
    onPressed: (){

      PatientDatabase.PatientRealtime(pid.toString(), name.toString(), _currentDay.toString(), _currentIndex.toString());


      Map <String,dynamic> data={

        "Time": _currentIndex.toString(),
        "Date": _currentDay.toString(),
        "did": eid.toString(),
        "pid": pid.toString(),




      };
      FirebaseFirestore.instance.collection("Appointment").add(data);

      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>const AppointmentBooked()));
    },
    disable: _timeSelected && _dateSelected ? false : true,
    ),
        ),
    ),
    ],
),
    );
  }

  Widget _tableCalender() {
    return TableCalendar(focusedDay: _focusDay, firstDay: DateTime.now(),
        lastDay:DateTime(2025,12,31),
        calendarFormat: _format,
        currentDay: _currentDay,
        rowHeight: 48,
        calendarStyle: const CalendarStyle(
          todayDecoration:
          BoxDecoration(
              color: Colors.lightBlue,shape: BoxShape.circle
          ),
        ),
        availableCalendarFormats: const{
          CalendarFormat.month: 'Month,'
        },
        onFormatChanged: (format) {
          setState(() {
            _format = format;
          }
          );
        },
        onDaySelected: (selectedDay, focusedDay){
          setState(() {
            _currentDay = selectedDay;
            _focusDay = focusedDay;
            _dateSelected = true;
            if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
              _isWeekend = true;
              _timeSelected = false;
              _currentIndex = null;
            } else {
              _isWeekend=true;
            }
          }
          );
        }
    );
  }

}