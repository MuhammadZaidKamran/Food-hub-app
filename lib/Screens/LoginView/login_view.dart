import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/ForgotPasswordView/forgot_password_view.dart';
import 'package:food_hub_2/Screens/HomeView/home_view.dart';
import 'package:food_hub_2/Screens/LoginView/login_view_model.dart';
import 'package:food_hub_2/Screens/SignUpView/sign_up_view.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          backgroundColor: AppColors().whiteColor,
          body: Form(
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                      color: AppColors().yellowColor
                    ),
                    child: Center(child: Image.asset("assets/images/fruit-basket-2.png",width: 200,height: 200,)),
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
                            Text("LOGIN",
                            style: GoogleFonts.abel(
                              letterSpacing: 1,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(height: 60,),
                            TextFormField(
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
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordView()));
                                },
                                child: Text("Forgot Password?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
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
                                  await viewModel.login(context);
                                  viewModel.emailController.clear();
                                  viewModel.passwordController.clear();
                                },
                                child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 14),)
                                ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                SizedBox(width: 3,),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView()));
                                  },
                                  child: Text("Sign Up",style: TextStyle(color: AppColors().yellowColor,fontWeight: FontWeight.w500),),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("OR"),
                            SizedBox(height: 30,),
                            GestureDetector(
                              onTap: () {
                                 viewModel.signInWithGoogle(context);
                               // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.red
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset("assets/images/google-icon.png",width: 30,height: 30,)
                                      ),
                                    SizedBox(width: 8,),
                                    Text("Login with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)
                                  ],
                                ),
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
          ),
        );
      }
      );
  }
}