import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_hub_2/Admin/Items/items_view_model.dart';
import 'package:stacked/stacked.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ItemsViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          appBar: AppBar(
            title: Text("Admin"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  viewModel.selectedImage == null ?
                  InkWell(
                    onTap: () {
                      viewModel.getImage();
                    },
                    child: Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  )
                  :
                  Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(viewModel.selectedImage!,fit: BoxFit.cover,),
                          )
                      ),
                    ),
                  SizedBox(height: 20,),
                  Text("Add Image",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: 45,),
                  TextField(
                    controller: viewModel.itemName,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(22, 158, 158, 158),
                      filled: true,
                      hintText: "Item Name",
                      border: OutlineInputBorder(
                        //borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: viewModel.itemPrice,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(22, 158, 158, 158),
                      filled: true,
                      hintText: "Item Price",
                      border: OutlineInputBorder(
                        //borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: viewModel.itemQuantity,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(22, 158, 158, 158),
                      filled: true,
                      hintText: "Item Quantity",
                      border: OutlineInputBorder(
                        //borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ))
                        ),
                      onPressed: (){
                        
                      },
                      child: Text("Add",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
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