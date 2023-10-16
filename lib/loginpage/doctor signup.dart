import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorpatient_app/loginpage/authpage2.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'model.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
  new TextEditingController();
  final TextEditingController Name = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  TextEditingController otp = new TextEditingController();
  TextEditingController Specilization = new TextEditingController();
  EmailOTP myauth = EmailOTP();
  bool _isObscure = true;

  File? file;
  var options = [
    'Student',
    'Teacher',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/register.png',
            ),fit: BoxFit.cover,
          ),
        ),

                child: Container(
                 padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formkey,
                    child:ListView(
                    
                    children: [
                      Column(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
const Padding(padding: EdgeInsets.all(0.8)),
                     SingleChildScrollView(
                       padding: const EdgeInsets.only(top: 60),
                     child: TextFormField(
                      controller: Name,
                      decoration: const InputDecoration(
                        filled: true,

                        hintText: 'Name',

                        labelText: ('Name'),
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.person,
                          color: Colors.black,
                        ),


                        enabled: true,
                        contentPadding: EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),

                      ),
                      ),),

                   Padding(padding: EdgeInsets.all(15)),
                        Column(
                            children: [
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,

                            hintText: 'Email',

                            labelText: ('Email'),
                            alignLabelWithHint: true,
                            prefixIcon: Icon(Icons.email,
                              color: Colors.black,
                            ),
                            enabled: true,

                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        ),
                        )
                ]),
                        ElevatedButton(
                            onPressed: () async {
                              myauth.setConfig(
                                  appEmail: "tanishachouhan.com",
                                  appName: "Email OTP",
                                  userEmail: emailController.text,
                                  otpLength: 6,
                                  otpType: OTPType.digitsOnly
                              );
                              if (await myauth.sendOTP() == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("OTP has been sent"),
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Oops, OTP send failed"),
                                ));
                              }
                            },

                            child: const Text("Send OTP")),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              controller: otp,
                              decoration:
                              const InputDecoration(hintText: "Enter OTP",

                                labelText: ('OTP'),
                                alignLabelWithHint: true,
                                prefixIcon: Icon(Icons.numbers,
                                  color: Colors.black,
                                ),
                              )),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (await myauth.verifyOTP(otp: otp.text) == true) {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("OTP is verified"),
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Invalid OTP"),
                                ));
                              }
                            },
                            child: const Text("Verify")),
                  SingleChildScrollView(
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: Specilization,
                          decoration: InputDecoration(
                            filled: true,

                            hintText: 'Specilization',

                            labelText: ('Specilization'),
                            alignLabelWithHint: true,
                            prefixIcon: Icon(Icons.medical_services,
                              color: Colors.black,
                            ),
                            enabled: true,

                          ),
                        ),
                    )]),),
                        Padding(padding: EdgeInsets.all(15)),
                  SingleChildScrollView(
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                        child: TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            filled: true,

                            hintText: 'Password',
                            enabled: true,

                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 8 character");
                            } else {


                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        ),)]
                  ),
                  ),
                         SingleChildScrollView(
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            ElevatedButton(

                              onPressed: () async{
    if (await myauth.verifyOTP(otp: otp.text) == true){
                                setState(() {
                                  showProgress = true;
                                });
                                signUp(emailController.text,
                                    passwordController.text,Name.text,Specilization.text);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(
    content: Text("SignUp Sucessfull!")));
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => AuthPage2()));
                                }else{
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                content: Text("Please! Verify OTP!"),
                                ));
                                }
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 20,


                                ),
                              ),

                            ),
                          ],
                        ),
                        )
                      ],
                    ),

                  ],
                    ),
                 ]
                ),
              ),
            ),
      )
      );

  }

  void signUp(String email, String password, String name ,String Specilization) async {
    CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email,password,name , Specilization)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String password,String name, String specilization) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.name=name;
    userModel.Specilization= specilization;
    userModel.email = email;
    userModel.uid = user!.uid;
   userModel.password=password;
    await firebaseFirestore
        .collection("doctors")
        .doc(user.uid)
        .set(userModel.toMap());



  }
}
