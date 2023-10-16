import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
String docid="";

class Apdoc{
  static func(String id){
   docid=id;

  }
}
class FetchData extends StatefulWidget {


  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {


  Query dbRef = FirebaseDatabase.instance.ref().child('$docid');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('$docid');
bool isSwitched=false;

  Widget listItem({required Map docid}) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      height: 200,
      color: Colors.amberAccent,

      child:
      Column(



        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [

          CustomSwitch(
            value:isSwitched ,
            activeColor: Colors.green,
            onChanged: (value){
              print("value: $value");
              setState(() {
                isSwitched=value;
              });
            },

          ),
          SizedBox(height: 15.0),
          Text("value:$isSwitched",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.red
              )
          ),


          Text(
            "Name:  " + docid['name'],

            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Date:  " + docid['date'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),

          Text(
            "Time:  " +  docid['time'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {

                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(docid['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: Colors.blueAccent,

        body: Container(

          height: double.infinity,
          child: FirebaseAnimatedList(

            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              Map docid = snapshot.value as Map;
              docid['key'] = snapshot.key;
Column(
  children: <Widget>[
    CustomSwitch(
      value:isSwitched ,
      activeColor: Colors.green,
      onChanged: (value){
        print("value: $value");
        setState(() {
          isSwitched=value;
        });
      },

    ),
    SizedBox(height: 15.0),
    Text("value:$isSwitched",
        style: TextStyle(
            fontSize: 15,
            color: Colors.red
        )
    ),


  ],
);
              return listItem(docid: docid);
},
          ),

        ),

    );
  }
}