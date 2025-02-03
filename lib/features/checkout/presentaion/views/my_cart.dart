import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentaion/views/widget/my_cart-view_body.dart';

import '../../../../core/widget/custom_app_bar.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Cart'),
      body: MyCartviewBody(),
    );
  }

  
}
