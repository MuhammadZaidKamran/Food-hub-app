import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class ItemsViewModel extends BaseViewModel {
  TextEditingController itemName = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  TextEditingController itemQuantity = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async{
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    rebuildUi();
  }
}