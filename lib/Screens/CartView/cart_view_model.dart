import 'dart:ui';

import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/Services/Models/item_model.dart';
import 'package:stacked/stacked.dart';

class CartViewModel extends BaseViewModel {
  List<ItemModel> displayItems = List.from(cartItem);

  removeItem(index){
    displayItems.removeAt(index);
    rebuildUi();
  }

  removeAll(){
    displayItems.removeRange(0, displayItems.length);
    cartItem.removeRange(0,displayItems.length);
    rebuildUi();
  }

  totalPrice(){
    int myTotal = 0;
    for (var element in cartItem) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }

}