import 'package:flutter/material.dart';
import 'package:payment/core/widget/custom_app_bar.dart';
import 'package:payment/features/checkout/presentaion/views/widget/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Transform.translate(
          offset: Offset(0, -16), child: ThankYouViewBody()),
    );
  }
}
