import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/presentaion/views/my_cart.dart';

void main() {
  Stripe.publishableKey = ApiKeys.puplishedKey;
  runApp(const CheckOut());
}

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: MyCart(),
    );
  }
}
