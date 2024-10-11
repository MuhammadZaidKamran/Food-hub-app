import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/ForgotPasswordView/forgot_password_view_model.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ForgotPasswordViewModel(), 
      builder: (context,viewModel,child){
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Password Reset",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          ),
          body: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter Email to Reset Password",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)
                    ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: viewModel.emailController,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@gmail.com")) {
                        return "Please enter valid Email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail,color: AppColors().blueGrey,),
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(color: AppColors().blueGrey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColors().yellowColor)
                      ),
                      onPressed: (){
                        viewModel.passwordReset(context);
                      },
                      child: Text("Send Email",style: TextStyle(color: Colors.white,fontSize: 15),)
                      ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      );
  }
}