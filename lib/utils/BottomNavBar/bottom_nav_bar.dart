import 'package:flutter/material.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:food_hub_2/utils/BottomNavBar/bottom_nav_bar_model.dart';
import 'package:stacked/stacked.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottomNavBarModel(),
      builder: (context,viewModel,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: viewModel.widgetList[viewModel.myIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                viewModel.myIndex = value;
                viewModel.rebuildUi();
              },
              currentIndex: viewModel.myIndex,
              unselectedItemColor: Colors.black,
              selectedItemColor: AppColors().yellowColor,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home",backgroundColor: AppColors().yellowColor),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "Cart",backgroundColor: AppColors().yellowColor),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border_rounded),label: "Favorites",backgroundColor: AppColors().yellowColor),
              ]
              ),
          ),
        );
      }
      );
  }
}