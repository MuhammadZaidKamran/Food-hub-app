import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/FavoriteView/favorite_view_model.dart';
import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => FavoriteViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: AppColors().yellowColor,
            title: Text("Favorites",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w700),),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: viewModel.favorite_items.length,
            itemBuilder: (context,index){
              final favItem = viewModel.favorite_items[index];
              return Container(
                margin: EdgeInsets.only(top: 12,right: 15,left: 15),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  contentPadding: EdgeInsets.all(15),
                  tileColor: AppColors().whiteColor,
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: favItem.itemColor
                    ),
                    child: Image(image: favItem.image,width: 70,height: 70,)
                    ),
                    title: Row(
                      children: [
                        Text(favItem.itemName.toString(),style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        IconButton(onPressed: (){
                          viewModel.removeItem(index);
                          favoriteList.remove(favItem);
                          viewModel.rebuildUi();
                        }, icon: Icon(Icons.cancel_outlined,color: Colors.red,))
                      ],
                    ),
                    subtitle: Text("Rs.${favItem.price}",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w600),),
                ),
              );
            }
            ),
        );
      }
      );
  }
}