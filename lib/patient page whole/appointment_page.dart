import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget{
  const AppointmentPage ({Key?key}): super(key: key);

  @override
  State<AppointmentPage> createState()=> _AppointmentPageState();

}

enum FilterStatus {upcoming , complete , cancel}

class _AppointmentPageState extends State<AppointmentPage>{
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic>schedules = [
    {
      "doctor_name":"Dr.Deepak Agarwal",
      "doctor_profile":"assets/images/50.jpg",
      "category":"Cancer Surgery",
      "status":FilterStatus.upcoming,
    },
    {
      "doctor_name":"Dr.Siddhant",
      "doctor_profile":"assets/images/doctor2.png",
      "category":" Heart surgeon",
      "status":FilterStatus.complete,},
    {
      "doctor_name":"Dr.Divyanshu Goyal",
      "doctor_profile":"assets/images/bone surgun.jpg",
      "category":"Bone Surgeon",
      "status":FilterStatus.complete,
    },
    {
      "doctor_name":"Dr.Moiz Topiwala",
      "doctor_profile":"assets/images/moiz.png",
      "category":"Chest Physician",
      "status":FilterStatus.cancel,
    },
    {
      "doctor_name":"Dr.Sabarwal",
      "doctor_profile":"assets/images/d.jpg",
      "category":"General Physican",
      "status":FilterStatus.upcoming,
    },


  ];
  @override
  Widget build(BuildContext context){
    List<dynamic>filteredSchedules = schedules.where((var schedule) {
      //switch(schedule['status']){
        //case 'upcoming':
          //schedule['status']=FilterStatus.upcoming;
          //break;
        //case 'complete':
          //schedule['status']=FilterStatus.complete;
          //break;
        //case 'cancel':
          //schedule['status']=FilterStatus.cancel;
         // break;
      //}
    return schedule['status'] == status;
    }).toList();

    return SafeArea(child: Padding(
      padding: EdgeInsets.only(left: 20,top:20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          const Text('Appointment Schedule',
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for(FilterStatus filterStatus in FilterStatus.values)
                      Expanded(

                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              if(filterStatus==FilterStatus.upcoming){
                                status=FilterStatus.upcoming;
                                _alignment = Alignment.centerLeft;
                              }else if(filterStatus==FilterStatus.complete){
                                status=FilterStatus.complete;
                                _alignment = Alignment.center;
                              }else if(filterStatus==FilterStatus.cancel) {
                                status = FilterStatus.cancel;
                                _alignment = Alignment.centerRight;
                              }
    });
                          },
                          child: Center(
                            child: Text(filterStatus.name),
                          ),
                        ),
                      ),
                  ],

                ),
              ),
              AnimatedAlign(alignment: _alignment, duration: Duration(microseconds: 200
                ,),
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  child: Text(
                    status.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              )
            ],
          ),
          Expanded(child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: ((context,index){
                var _schedule = filteredSchedules[index];
                bool isLastElement = filteredSchedules.length + 1 == index;
                return Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: !isLastElement? EdgeInsets.only(bottom: 20):EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(_schedule['doctor_profile']),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(


                                  _schedule['doctor_name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _schedule['category'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ScheduleCard(),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: OutlinedButton(onPressed: () {

                            },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.green
                                ),
                              ),

                            ),),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child:OutlinedButton(
                style:OutlinedButton.styleFrom(
                             backgroundColor:Colors.green,
                ),
                              onPressed:(){},
                              child: const Text(
                                'Reschedule',
                                style: TextStyle(
                                    color: Colors.white,
                                ),
                              ),

                            ),),
                          ],

                        )
                      ],
                    ),
                  ),
                );

              }),
              )
          ),

        ],

      ),
    ));
  }
}

class ScheduleCard extends StatelessWidget {
  ScheduleCard({Key?key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
decoration: BoxDecoration(
  color: Colors.grey.shade100,
  borderRadius: BorderRadius.circular(10),
),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(Icons.calendar_today,
          color: Colors.green,
          size: 15,),
          SizedBox(
            width: 20,
          ),
          Text('Monday , 01/23/2023',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          Icon(Icons.access_alarm,
          color: Colors.green,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(child: Text(
            '2:00 AM',
            style: TextStyle(
              color: Colors.green,
            ),
          ),)
        ],
      ),
    );
  }
}