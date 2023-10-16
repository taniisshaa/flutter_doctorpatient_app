import 'package:doctorpatient_app/loginpage/Start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/main_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());



}



class MyApp extends StatelessWidget {
  final Future<FirebaseApp>_initialization = Firebase.initializeApp();

  MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Doctor-patient',
            theme: ThemeData(


              inputDecorationTheme: const InputDecorationTheme(
                focusColor: Colors.lightBlueAccent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.lightBlueAccent,
                ),
                prefixIconColor: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.lightBlueAccent,
                selectedItemColor: Colors.white,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                unselectedItemColor: Colors.blueAccent,
                elevation: 10,
                type: BottomNavigationBarType.fixed,
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => Start(),
              'main': (context) => const MainLayout(),
            },
          );
        });
  }
}



