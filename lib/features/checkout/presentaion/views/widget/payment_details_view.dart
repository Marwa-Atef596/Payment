import 'package:flutter/material.dart';
import 'package:payment/core/widget/custom_app_bar.dart';
import 'package:payment/features/checkout/presentaion/views/widget/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Payment Details'),
      body: PaymentDetailsViewBody(),
    );
  }
}
