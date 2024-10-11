import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/HomeView/home_view.dart';
import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/utils/BottomNavBar/bottom_nav_bar.dart';
import 'package:stacked/stacked.dart';

class VerificationViewModel extends BaseViewModel {
  late Timer timer;

  // emailVerification(context) async{
  //   try {
      
  //   } catch (e) {
  //    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  // }

  verificationTimer(context , String userName , String email){
    timer = Timer.periodic(Duration(seconds: 5), (timer){
      FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
        user_name1 = FirebaseAuth.instance.currentUser!.email;
      }
    });
  }


  signUpUser(BuildContext context , TextEditingController userController, TextEditingController emailController , TextEditingController passwordController) async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
  await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
      'Username' : userController.text,
      "Email" : emailController.text,
      "id" : credential.user!.uid,
    })
    .then((value) => print("Added"))
    .catchError((error) => print("Failed to add user: $error"));
   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerificationView()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The password provided is too weak.",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
  } else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The account already exists for that email.",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
  }
} catch (e) {
  print(e);
}
  }
}