import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_hub_2/Services/CartFunctionality/cart_functionality.dart';
import 'package:food_hub_2/Services/Stripe/stripe_keys.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(amount) async{
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(amount, "usd");
      if(paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Muhammad Zaid",
      ));
      await _processPayment();
      //print(cartItem.length);
      //await cartItem.remove(display_item);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(int amount , String currency) async{ 
   try {
    final Dio dio = Dio();
     Map<String,dynamic> data = {
      "amount" : _calculateAmount(amount),
      "currency" : currency,
     };
     var response = await dio.post(
      "https://api.stripe.com/v1/payment_intents",
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
        "Authorization" : "Bearer $stripeSecretKey",
        "Content-Type" : "application/x-www-form-urlencoded",
      },
      )
      );
      if (response.data != null) {
        return response.data['client_secret'];
      }
      return null;
   } catch (e) {
     print(e);
   }
   return null;
  }

  Future<void> _processPayment() async{
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print(e);
    }
  }

  String? _calculateAmount(int amount){
    final calculatedAmount = amount * 100;
    return calculatedAmount.toString();
  }
}