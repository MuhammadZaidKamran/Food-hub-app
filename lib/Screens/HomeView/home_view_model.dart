import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/HomeView/Drawer/drawer_widget.dart';
import 'package:food_hub_2/Services/CounterService/counter_service.dart';
import 'package:food_hub_2/Services/Models/item_model.dart';
import 'package:food_hub_2/app/app.locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  // textFunction() {
  //   if (FirebaseAuth.instance.currentUser!.email!) {
      
  //   }
  // }

  List<ItemModel> items = [
    ItemModel(AssetImage("assets/images/breakfast-red-fruit-salad.png"), "Quinoa fruit salad", 2000,Color.fromARGB(25, 255, 165, 81),CounterService().counter,false,false,false),
    ItemModel(AssetImage("assets/images/Tropical-Fruit-Salad.png"), "Tropical fruit salad", 8000,const Color.fromARGB(26, 240, 97, 145),CounterService().counter,false,false,false),
    ItemModel(AssetImage("assets/images/Honey-Lime-Peach-Fruit-Salad.png"), "Honey lime salad", 12000,const Color.fromARGB(29, 215, 101, 235),CounterService().counter,false,false,false),
    ItemModel(AssetImage("assets/images/Glowing-Berry-Fruit-Salad.png"), "Glowing berry salad", 7000,const Color.fromARGB(24, 33, 149, 243),CounterService().counter,false,false,false),
  ];
}