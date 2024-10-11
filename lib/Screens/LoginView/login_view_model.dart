import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_hub_2/Screens/HomeView/home_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(context) async{
    try {
      
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeView()));
  print("Successfully Logged in");
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for that email.",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
    print("No user found for that email.");
  } else if (e.code == 'wrong-password') {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password provided for that user.",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
     print("Wrong password provided for that user.");
  }
}
  }

Future<UserCredential?> signInWithGoogle(context) async {
  // Trigger the authentication flow
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

 // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));// Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }on PlatformException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
  }
}
  
}