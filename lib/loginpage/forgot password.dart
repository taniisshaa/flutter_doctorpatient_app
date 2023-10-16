import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpass extends StatefulWidget{
  const Forgotpass ({Key?key}): super(key: key);

  @override
  State<Forgotpass> createState()=>_Forgotpass();

}
class  _Forgotpass extends State<Forgotpass>{
final emailController = TextEditingController();
@override
void dispose(){
  emailController.dispose();
  super.dispose();
}
Future passwordreset()async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim());
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Password reset link sent check your email"),
          );
        });
  } on FirebaseAuthException catch (e) {
    print(e);
    showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        });
  }
}

    @override
    Widget build(BuildContext context) {
      return  Scaffold(
          body:
          Container(

          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/images/register.png',
      ),fit: BoxFit.cover,
      ),
      ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 25.0)),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                constraints: BoxConstraints(maxWidth: double.infinity),

                  hintText: "Email"
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: () => passwordreset(),
                child: Text("Reset Password"))


          ],
        ),
          )
      );
    }
  }
