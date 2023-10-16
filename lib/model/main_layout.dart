import 'package:doctorpatient_app/patient%20page%20whole/appointment_page.dart';
import 'package:doctorpatient_app/patient%20page%20whole/homeScreen1.dart';
import 'package:doctorpatient_app/intro/intro.dart';
import 'package:flutter/material.dart';


class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State< MainLayout > createState()=> _MainLayoutState();
}
class _MainLayoutState extends State< MainLayout > {
  int currentPage=0;
  final PageController _page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: PageView(
  controller: _page,
  onPageChanged: ((value){
    setState(() {
      currentPage=value;
    });
    }),
 children: [
   IntroScreen(),
   HomeScreen1(),
   AppointmentPage(),

 ],

),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:currentPage ,
        onTap: (page){
          setState(() {
            currentPage=page;
            _page.animateToPage(page,
                duration: const Duration(microseconds: 500), curve: Curves.easeInOut,);
          });
        },
        items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
      icon: Icon(Icons.screen_lock_landscape),
      label: 'screen',),
          BottomNavigationBarItem(
             icon: Icon(Icons.house),
            label: 'Home',
          ),

          BottomNavigationBarItem(
    icon: Icon(Icons.calendar_month),
    label: 'Appointment',
    ),

        ],
      ),
    );
  }
}