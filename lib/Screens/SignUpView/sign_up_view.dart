import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/SignUpView/sign_up_view_model.dart';
import 'package:food_hub_2/Screens/VerificationView/verification_view.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          backgroundColor: AppColors().whiteColor,
          body: Form(
            key: viewModel.formkey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 45, 30, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                    color: AppColors().yellowColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors().whiteColor,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios_new,size: 17,),
                                  Text("Go Back",
                                  style: GoogleFonts.aclonica(
                                    fontSize: 13
                                  ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(child: Image.asset("assets/images/fruit-basket-2.png",width: 200,height: 200,)),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors().whiteColor,
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Text("SIGN UP",
                          style: GoogleFonts.abel(
                            letterSpacing: 1,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          SizedBox(height: 60,),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter username";
                              } else {
                                return null;
                              }
                            },
                            controller: viewModel.userController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle_rounded,color: AppColors().blueGrey,),
                              contentPadding: EdgeInsets.all(17.0),
                              hintText: "Username",
                              hintStyle: TextStyle(color: AppColors().blueGrey),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none
                              )
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || !value.contains("@gmail.com")) {
                                return "Please Enter valid Email";
                              } else {
                                return null;
                              }
                            },
                            controller: viewModel.emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail,color: AppColors().blueGrey,),
                              contentPadding: EdgeInsets.all(17.0),
                              hintText: "Email",
                              hintStyle: TextStyle(color: AppColors().blueGrey),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none
                              )
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value.length < 6) {
                                return "Password must Contain atleast 6 Characters";
                              } else {
                                return null;
                              }
                            },
                            controller: viewModel.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password,color: AppColors().blueGrey,),
                              contentPadding: EdgeInsets.all(17.0),
                              hintText: "Password",
                              hintStyle: TextStyle(color: AppColors().blueGrey),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              )
                            ),
                          ),
                          SizedBox(height: 60,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(AppColors().yellowColor)
                              ),
                              onPressed: () async{
                                if (viewModel.formkey.currentState!.validate()) {
                                 await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerificationView(email: viewModel.emailController,password: viewModel.passwordController,user: viewModel.userController,)));
                                   viewModel.emailController.clear();
                                   viewModel.userController.clear();
                                   viewModel.passwordController.clear();
                                }
                              },
                              child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 14),)
                              ),
                          ),
                        ],
                      ),
                    )
                    ),
                ),
              ],
            ),
          ),
        );
      }
      );
  }
}