import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/CartView/cart_view.dart';
import 'package:food_hub_2/Screens/FavoriteView/favorite_view.dart';
import 'package:food_hub_2/Screens/HomeView/ComboWidget/combo_widget.dart';
import 'package:food_hub_2/Screens/HomeView/Drawer/drawer_widget.dart';
import 'package:food_hub_2/Screens/HomeView/home_view_model.dart';
import 'package:food_hub_2/Screens/HomeViewItemDetails/home_view_item_details.dart';
import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key ,});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          drawer: Drawer(
            shadowColor: AppColors().yellowColor,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/food.jpg")),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 10, 20),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(160, 255, 165, 81),
                    //  image: 
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.account_circle,size: 60,color: Colors.black,),
                        SizedBox(width: 5,),
                        Expanded(child: Text("${FirebaseAuth.instance.currentUser!.email ?? "Useremail"}",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(111, 255, 186, 122)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_basket_outlined,size: 35,),
                              SizedBox(width: 15,),
                              Text("My Basket",style: GoogleFonts.aBeeZee(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                       InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteView()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(111, 255, 186, 122)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.favorite_border_rounded,size: 35,),
                              SizedBox(width: 15,),
                              Text("Favorites",style: GoogleFonts.aBeeZee(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
              margin: EdgeInsets.only(bottom: 40),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.64,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: isPressed ? WidgetStatePropertyAll(Colors.white) : WidgetStatePropertyAll(AppColors().yellowColor)),
                    onPressed: () async{
                      isPressed = true;
                      viewModel.rebuildUi();
                      await FirebaseAuth.instance.signOut();
                      isPressed = false;
                      viewModel.rebuildUi();
                   },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      Icon(Icons.output_rounded,size: 28,color: isPressed ? Colors.black : Colors.white,),
                      SizedBox(width: 5,),
                       Text("SignOut",style: GoogleFonts.aBeeZee(fontSize: 16,color: isPressed ? Colors.black : Colors.white,fontWeight: FontWeight.bold),),
                     ],
                   ),),
                )
                //container,
                // Container(
                //   child: ElevatedButton(
                //     style: ButtonStyle(backgroundColor: isPressed ? WidgetStatePropertyAll(Colors.yellow) : WidgetStatePropertyAll(Colors.white)),
                //     onPressed: (){
                      
                //    },
                //    child: Text("SignOut"),),
                // )
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
                        padding: EdgeInsets.fromLTRB(25, MediaQuery.of(context).size.height * 0.045, 25, 10),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Builder(builder: (context) => IconButton(
                                      onPressed: (){
                                        Scaffold.of(context).openDrawer();
                                      },
                                      icon: Icon(Icons.menu_open_sharp,size: 30,color: Colors.black,))),
                                      cartItem.isEmpty ?
                                      GestureDetector(
                                        onTap: () async{
                                          await Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
                                            viewModel.rebuildUi();
                                        },
                                        child: Column(
                                          children: [
                                            Icon(Icons.shopping_basket_rounded,size: 33,color: AppColors().yellowColor,),
                                            Text("My Basket",style: TextStyle(fontSize: 12),)
                                          ],
                                        ),
                                      )
                                      :
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Badge(
                                          label: Text("${cartItem.length}"),
                                          child: GestureDetector(
                                          onTap: () async{
                                            await Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
                                            viewModel.rebuildUi();
                                          },
                                          child: Column(
                                            children: [
                                              Icon(Icons.shopping_basket_rounded,size: 33,color: AppColors().yellowColor,),
                                              Text("My Basket",style: TextStyle(fontSize: 12),)
                                            ],
                                          ),
                                        ),
                                        ),
                                      ),
                                  ],
                        ),
                        SizedBox(height: 35,),
                        Container(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: Text("Hello, What fruit salad combo do you want today?",style: GoogleFonts.aclonica(
                                    fontSize: 19
                                  ),
                                  ),
                        ),
                        SizedBox(height: 40,),
                        SearchBar(
                                  elevation: WidgetStatePropertyAll(0),
                                  padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  )),
                                  hintText: "Search for fruit salad combos",
                                  hintStyle: WidgetStatePropertyAll(TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors().blueGrey)),
                                  leading: Icon(Icons.search_rounded,size: 27,color: AppColors().blueGrey,),
                        ),
                        SizedBox(height: 30,),
                        Text("Recommended Combo",style: GoogleFonts.aBeeZee(fontSize: 21,fontWeight: FontWeight.w700),),
                        SizedBox(height: 35,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         comboContainer(context, "Honey lime combo", "assets/images/Honey-Lime-Peach-Fruit-Salad.png", "Rs.2000", false),
                         comboContainer(context, "Berry mango combo", "assets/images/Glowing-Berry-Fruit-Salad.png", "Rs.8000", false),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text("Super Rated",style: GoogleFonts.aBeeZee(fontSize: 22,fontWeight: FontWeight.bold)),
                        SizedBox(height: 35,),
                        SizedBox(
                          height: 210,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: viewModel.items.length,
                            itemBuilder: (context,index){
                              final item = viewModel.items[index];
                               return GestureDetector(
                                 onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeViewItemDetails(itemDetails: item)));
                                 },
                                 child: Container(
                                          margin: EdgeInsets.only(right: 15),
                                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: item.itemColor,
                                          ),
                                                //  height: 100,
                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              item.isFavorite = !item.isFavorite;
                                                            if (item.isFavorite == true) {
                                                             favoriteList.add(item);
                                                              // item.isAdded = false;
                                                              } else if(item.isFavorite == false) {
                                                                favoriteList.remove(item);
                                                                 }
                                                                 viewModel.rebuildUi();
                                                            },
                                                            child: item.isFavorite ? 
                                                            Icon(Icons.favorite,color: Colors.red,size: 25,)
                                                            :
                                                            Icon(Icons.favorite_border,size: 25,color: AppColors().yellowColor,)
                                                            )
                                                        ],
                                                      ),
                                                      Center(
                                                        child: Image(image: item.image,width: 80,height: 80,),
                                                      ),
                                                      SizedBox(height: 8,),
                                                      Text(item.itemName.toString(),style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.bold),),
                                                      Spacer(),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(item.price.toString(),style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors().yellowColor),),
                                                          Container(
                                                            padding: EdgeInsets.all(3),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(30),
                                                              color: item.isAdded ? Colors.green
                                                              :
                                                              AppColors().lightYellowColor,
                                                            ),
                                                            child: Center(
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  item.isAdded = true;
                                                                  item.isAdded_2 = true;
                                                                  if (item.isAdded == true && item.isAdded_2 == true) {
                                                                    cartItem.add(item);
                                                                    item.quantity +=1;
                                                                    item.isAdded_2 = false;
                                                                    // itemDetails.isAdded = false;  
                                                                    }
                                                                     viewModel.rebuildUi();
                                                                },
                                                                child: item.isAdded ?
                                                                Icon(Icons.check,color: Colors.white,)
                                                                :
                                                                Icon(
                                                                   Icons.add,color: AppColors().yellowColor,),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                           
                                                    ],
                                                  ),
                                                ),
                               );
                          }
                          ),
                        )
                        ],
                                            ),
                      ),
          ),
        );
      }
      );
  }
}