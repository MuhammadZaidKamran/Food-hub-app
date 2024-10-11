import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub_2/Screens/VerificationView/verification_view_model.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:stacked/stacked.dart';

class VerificationView extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController user;
  final TextEditingController password;
  const VerificationView({super.key,required this.email,required this.password,required this.user});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) async{
        await viewModel.signUpUser(context, user, email, password);
        await viewModel.verificationTimer(context , user.text,email.text);
        
      },
      viewModelBuilder: () => VerificationViewModel(),
      builder: (context,viewModel,child){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mail_outline_rounded,size: 80,),
                  SizedBox(height: 20,),
                  Text("We have sent an Email for Verification!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(AppColors().yellowColor)
                      ),
                      onPressed: () async{
                        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                      },
                      child: Text("Resend Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),)
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