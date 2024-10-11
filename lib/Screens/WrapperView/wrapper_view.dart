import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/OnBoardView/onboard_view.dart';
import 'package:food_hub_2/utils/BottomNavBar/bottom_nav_bar.dart';
import 'package:food_hub_2/utils/BottomNavBar/bottom_nav_bar_model.dart';

class WrapperView extends StatelessWidget {
  const WrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return BottomNavBar();
          } else {
            return OnboardView();
          }
        }
        ),
    );
  }
}