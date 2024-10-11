import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/CartView/cart_view.dart';
import 'package:food_hub_2/Screens/FavoriteView/favorite_view.dart';
import 'package:food_hub_2/Screens/HomeView/home_view.dart';
import 'package:food_hub_2/Screens/HomeViewItemDetails/home_view_item_details_models.dart';
import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/Services/Models/item_model.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:food_hub_2/utils/BottomNavBar/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HomeViewItemDetails extends StatelessWidget {
  final ItemModel itemDetails;
  const HomeViewItemDetails({super.key,required this.itemDetails});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewItemDetailsModels(),
      builder: (context,viewModel,child){
        return Scaffold(
          backgroundColor: AppColors().yellowColor,
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors().yellowColor,
                ),
                padding: EdgeInsets.fromLTRB(30, 45, 30, 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () async{
                            await Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
                            },
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColors().whiteColor,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_new,size: 17,),
                                Text("Go Back",style: GoogleFonts.aclonica(
                                  fontSize: 13,
                                  ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        cartItem.isEmpty ?
                        IconButton(onPressed: ()async{
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
                          viewModel.rebuildUi();
                        }, icon: Icon(Icons.shopping_basket_outlined,color: AppColors().whiteColor,size: 23,))
                        : Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Badge(
                            label: Text("${cartItem.length}"),
                            child: GestureDetector(
                              onTap: () async{
                               await Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
                               viewModel.rebuildUi();
                              },
                              child: Icon(Icons.shopping_basket_outlined,color: AppColors().whiteColor,size: 23,),
                            ),
                          ),
                        ),

                        favoriteList.isEmpty ?
                        IconButton(onPressed: ()async{
                          await Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteView()));
                          viewModel.rebuildUi();
                        }, icon: Icon(Icons.favorite_border_rounded,color: AppColors().whiteColor,size: 23,))
                        : Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Badge(
                            label: Text("${favoriteList.length}"),
                            child: GestureDetector(
                              onTap: () async{
                               await Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteView()));
                               viewModel.rebuildUi();
                              },
                              child: Icon(Icons.favorite_border_rounded,color: AppColors().whiteColor,size: 23,),
                            ),
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Image(image: itemDetails.image,width: 200,height: 200,filterQuality: FilterQuality.high,),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      color: AppColors().whiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            itemDetails.itemName,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1
                          ),
                          )
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                                GestureDetector(
                                  onTap: () {
                                    if (itemDetails.quantity > 0) {
                                      itemDetails.quantity--;
                                      viewModel.rebuildUi();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 9,right: 9),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.7),
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Center(child: Text("-",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),))
                                    ),
                                ),
                                SizedBox(width: 13,),
                                Text(itemDetails.quantity.toString(),style: TextStyle(fontSize: 20),),
                                SizedBox(width: 13,),
                                GestureDetector(
                                  onTap: () {
                                    itemDetails.quantity++;
                                    viewModel.rebuildUi();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColors().lightYellowColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                         Icons.add,color: AppColors().yellowColor,),
                                  ),
                                                              ),
                                ),
                                Spacer(),
                                Text("Rs.${itemDetails.price.toString()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: 50,),
                          Divider(),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 2.0,color: AppColors().yellowColor))
                                ),
                                child: Text("One Pack Contains:",style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.w600),),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Text("Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",style: GoogleFonts.aBeeZee(fontSize: 19,fontWeight: FontWeight.w500),),
                          SizedBox(height: 30,),
                          Divider(),
                          SizedBox(height: 30,),
                          Text("If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you.",style: GoogleFonts.aBeeZee(fontSize: 16)
                          ),
                          SizedBox(height: 50,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                     // itemDetails.isAdded = true;
                                      itemDetails.isFavorite = !itemDetails.isFavorite;
                                      if (itemDetails.isFavorite == true) {
                                        favoriteList.add(itemDetails);
                                       // itemDetails.isAdded = false;
                                      } else if(itemDetails.isFavorite == false) {
                                        favoriteList.remove(itemDetails);
                                      }
                                      viewModel.rebuildUi();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color.fromARGB(33, 255, 165, 81),
                                      ),
                                      child: Center(
                                        child: itemDetails.isFavorite ? Icon(Icons.favorite,size: 40,color: Colors.red,)
                                         : 
                                         Icon(
                                           Icons.favorite_border_rounded,color: AppColors().yellowColor,size: 40,grade: 10,weight: 20,fill: 0.5,),
                                    ),
                                                                ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width * 0.55,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor: itemDetails.isAdded ? WidgetStatePropertyAll(Colors.green)
                                        :
                                        WidgetStatePropertyAll(AppColors().yellowColor),
                                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        ))
                                        ),
                                      onPressed: () {
                                        itemDetails.isAdded = true;
                                        itemDetails.isAdded_2 = true;
                                        if (itemDetails.isAdded == true && itemDetails.isAdded_2 == true) {
                                          cartItem.add(itemDetails);
                                          itemDetails.quantity +=1;
                                          itemDetails.isAdded_2 = false;
                                         // itemDetails.isAdded = false;  
                                        }
                                        viewModel.rebuildUi();
                                        
                                        // for (var i = 0; i < cartItem.length; i++) {
                                        //      if (cartItem[i].itemName == itemDetails.itemName) {
                                        //          cartItem[i].quantity++;
                                        //          print("already");
                                        //       } else{
                                        //          cartItem.add(itemDetails);
                                        //          print("added");
                                        //        }
                                        //         viewModel.rebuildUi();
                                        //       }
                                        // viewModel.cartFunction(itemDetails.itemName,itemDetails);
                                        // if (cartItem.contains(itemDetails.image)) {
                                        //   //itemDetails.quantity++;
                                        //   itemDetails.quantity++;
                                        //   print("already added");
                                        // } else {
                                        //   cartItem.add(itemDetails);
                                        //   print("added");
                                        // }
                                        // if (cartItem.contains(itemDetails)) {
                                        //   for (var i = 0; i < cartItem.length; i++) {
                                        //     cartItem[i].quantity++;
                                        //   } 
                                        // } else {
                                        //   cartItem.add(itemDetails);
                                        // }
                                        // for (var i = 0; i < cartItem.length; i++) {
                                        //     if (cartItem[i] == itemDetails) {
                                        //         print("Already Added");
                                        //         viewModel.rebuildUi();
                                        //         } else {
                                        //         print("successfully added");
                                        //         viewModel.rebuildUi();
                                        //         }
                                        //      }
                                        //for (ItemModel itemDetails in cartItem) {
                                          // if (!cartItem.contains(itemDetails)) {
                                          //   cartItem.add(itemDetails);
                                          // } else {
                                          //   for (var element in cartItem) {
                                          //     element.quantity++;
                                          //   }
                                          // }
                                          // viewModel.rebuildUi();
                                          
                                        //}
                                        // if (!cartItem.contains(itemDetails.itemName)) {
                                        //   cartItem.add(itemDetails);
                                        //  // viewModel.rebuildUi();
                                        // } else {
                                        //   //for (var element in cartItem) {
                                        //     //cartItem.remove(itemDetails);
                                        //     cartItem.remove(itemDetails);
                                        //    // viewModel.rebuildUi();
                                        //   //}
                                        // }
                                        //viewModel.functionality(itemDetails);                                   
                                      },
                                      child: itemDetails.isAdded ? Icon(Icons.check,color: Colors.white,size: 30,) 
                                      :
                                      Center(child: Text("Add to basket",style: GoogleFonts.aBeeZee(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),))
                                      ),
                                  )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                )
            ],
          ),
          
        );
      }
      );
  }
}