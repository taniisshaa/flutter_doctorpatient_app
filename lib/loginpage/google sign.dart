

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final  googleSignIn = GoogleSignIn();

 Future googleSign() async{
  GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if(googleSignInAccount != null){
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken ,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(credential);
   User user = await auth.currentUser!;
     print(user.uid);

     Future.value(true);
  }

}
Future signup(
String email, String password)async{
  try{
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return Future.value();
  }catch(e){
    switch(e.toString()){
      case '**invalid-email**':
        print("error");
    }
  }
}

Future signoutuser()async{

  User? user = await auth.currentUser!;
 if( user.providerData[1].providerId=='google.com')
  {
    await googleSignIn.disconnect();
  }
   await auth.signOut();
}
