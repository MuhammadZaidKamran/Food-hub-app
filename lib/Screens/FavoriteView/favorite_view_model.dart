import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/Services/Models/item_model.dart';
import 'package:stacked/stacked.dart';

class FavoriteViewModel extends BaseViewModel {

  List<ItemModel> favorite_items = List.from(favoriteList);

  removeItem(index){
    favorite_items.removeAt(index);
  }
}