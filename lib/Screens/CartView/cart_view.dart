import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/CartView/cart_view_model.dart';
import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/Services/Stripe/stripe_service.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors().yellowColor,
            elevation: 0,
            title: Text("My Basket",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w700)),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.displayItems.length,
                  itemBuilder: (context,index){
                    final item = viewModel.displayItems[index];
                    return Container(
                      //padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: 10,right: 15,left: 15),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        title: Row(
                          children: [
                            Text(item.itemName.toString(),style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600),),
                            Spacer(),
                            IconButton(onPressed: (){
                              viewModel.removeItem(index);
                              cartItem.remove(item);
                              viewModel.rebuildUi();
                            }, icon: Icon(Icons.delete,size: 23,color: AppColors().blueGrey,))
                          ],
                        ),
                        contentPadding: EdgeInsets.all(15),
                        tileColor: AppColors().whiteColor,
                        leading: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: item.itemColor,
                          ),
                          child: Image(image: item.image,width: 50,height: 50,)
                          ),
                          subtitle: Row(
                            children: [
                              GestureDetector(
                                      onTap: () {
                                        if (item.quantity > 0) {
                                          item.quantity--;
                                          viewModel.rebuildUi();
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 9,right: 9),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.7),
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Center(child: Text("-",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w900),))
                                        ),
                                    ),
                                    SizedBox(width: 13,),
                                    Text(item.quantity.toString(),style: TextStyle(fontSize: 18),),
                                    SizedBox(width: 13,),
                                    GestureDetector(
                                      onTap: () {
                                        item.quantity++;
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
                                             Icons.add,color: AppColors().yellowColor,size: 20,),
                                      ),
                                                                  ),
                                    ),
                                    Spacer(),
                                    Text("Rs.${item.price}",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          ),
                      ),
                    );
                }
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w500),),
                            Text("Rs.${viewModel.totalPrice()}",style: GoogleFonts.aBeeZee(fontSize: 21,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                              ),
                              backgroundColor: WidgetStatePropertyAll(AppColors().yellowColor)
                              ),
                            onPressed: () async{
                              Timer(Duration(seconds: 15),() async{
                                viewModel.removeAll();
                                cartItem.remove(viewModel.displayItems);
                                viewModel.rebuildUi();
                              });
                              await StripeService.instance.makePayment(viewModel.totalPrice());
                             // print(viewModel.displayItems);
                             // viewModel.removeAll();
                              //print(viewModel.displayItems);
                              // viewModel.displayItems.removeRange(0, 1);
                              // cartItem.remove(viewModel.displayItems.length);
                              // viewModel.rebuildUi();
                            },
                            child: Text("Checkout",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
                            ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
      );
  }
}