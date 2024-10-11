import 'package:flutter/material.dart';

class ItemModel {
  AssetImage image;
  String itemName;
  int price;
  Color itemColor;
  int quantity;
  bool isAdded;
  bool isFavorite;
  bool isAdded_2;

  ItemModel(
    this.image,
    this.itemName,
    this.price,
    this.itemColor,
    this.quantity,
    this.isAdded,
    this.isFavorite,
    this.isAdded_2,
    );
}