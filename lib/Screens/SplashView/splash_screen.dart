import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/OnBoardView/onboard_view.dart';
import 'package:food_hub_2/Screens/SplashView/splash_screen_model.dart';
import 'package:food_hub_2/Screens/WrapperView/wrapper_view.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) {
        //if (FirebaseAuth.instance.authStateChanges() == true) {
          Timer(Duration(seconds: 2), (){
           //if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WrapperView()));
           //}
          
        });
        //}
      },
      viewModelBuilder: () => SplashScreenModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Group 58.png",width: 190,height: 190,),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    color: AppColors().yellowColor,
                  ),
                  child: Text("Food Hub",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400,letterSpacing: 3),textAlign: TextAlign.center,),
                ),
                // Image.asset("assets/images/Group 59.png",width: 180,height: 180,),
              ],
            ),
          ),
        );
      }
      );
  }
}