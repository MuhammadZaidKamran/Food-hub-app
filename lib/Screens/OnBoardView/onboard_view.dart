import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/LoginView/login_view.dart';
import 'package:food_hub_2/Screens/OnBoardView/onboard_view_model.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => OnboardViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 60),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors().yellowColor
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/fruit-basket.png")
                      ]
                      )
                  ),
              ),
              SizedBox(height: 0,),
              Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 70),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors().whiteColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Get The Freshest Fruit Salad Combo",
                    style: GoogleFonts.belgrano(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 15,),
                    Text("We deliver the best and freshest fruit salad in town. Order for a combo today!!!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(height: 50,),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )),
                            backgroundColor: WidgetStatePropertyAll(AppColors().yellowColor)
                          ),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
                          },
                          child: Text("Let's Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                          ),
                          ),
                          ),
                      ),
                    )
                    
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