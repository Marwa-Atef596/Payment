import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:payment/core/widget/custom_button.dart';
import 'package:payment/features/checkout/presentaion/views/widget/custom_credit_card.dart';
import 'package:payment/features/checkout/presentaion/views/widget/thank_you_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //   SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(
            child: CustomCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,
        )),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: CustomButton(
                  txt: 'Payment',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      log('payment');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThankYouView(),
                        ),
                      );
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              )),
        )
      ],
    );
  }
}
