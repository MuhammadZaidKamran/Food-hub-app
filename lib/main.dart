import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_hub_2/Admin/Items/items.dart';
import 'package:food_hub_2/Screens/HomeView/home_view.dart';
import 'package:food_hub_2/Screens/SplashView/splash_screen.dart';
import 'package:food_hub_2/Services/Stripe/stripe_keys.dart';
import 'package:food_hub_2/firebase_options.dart';
import 'package:food_hub_2/utils/BottomNavBar/bottom_nav_bar.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   Stripe.publishableKey = stripePublishableKey;
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Items(),
    );
  }
}