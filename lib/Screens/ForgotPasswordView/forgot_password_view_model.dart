import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel{
  TextEditingController emailController = TextEditingController();

  passwordReset(context) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}