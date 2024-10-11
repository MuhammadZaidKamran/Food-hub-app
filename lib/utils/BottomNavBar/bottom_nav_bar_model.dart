import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_hub_2/Screens/CartView/cart_view.dart';
import 'package:food_hub_2/Screens/FavoriteView/favorite_view.dart';
import 'package:food_hub_2/Screens/HomeView/home_view.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarModel extends BaseViewModel {
  
  List widgetList = [
    HomeView(),
    CartView(),
    FavoriteView(),
  ];

  int myIndex = 0;
}


