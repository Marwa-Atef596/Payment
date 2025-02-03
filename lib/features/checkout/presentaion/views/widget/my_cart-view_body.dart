// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentaion/views/widget/order_info_item.dart';
import 'package:payment/features/checkout/presentaion/views/widget/payment_methods.dart';
import 'package:payment/features/checkout/presentaion/views/widget/total_price.dart';

import '../../../../../core/widget/custom_button.dart';

class MyCartviewBody extends StatelessWidget {
  const MyCartviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          SizedBox(
            height: 20,
          ),
          OrderInfoItem(title: 'Order Subtotal', value: r'$42.97'),
          SizedBox(
            height: 3,
          ),
          OrderInfoItem(title: 'Discount', value: r'$0'),
          SizedBox(
            height: 3,
          ),
          OrderInfoItem(title: 'Shipping', value: r'$8'),
          Divider(
            thickness: 2,
            color: Color(0xffc7c7c7),
            height: 34,
          ),
          TotalPrice(title: 'Total', value: r'$50.97'),
          SizedBox(
            height: 16,
          ),
          CustomButton(
            txt: 'Complete Payment',
            onPressed: () {
              //       Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PaymentDetailsView(),
              //   ),
              // );
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context,
                  builder: (context) {
                    return PaymentMethodBottomSheet();
                  });
            },
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(),
          SizedBox(
            height: 32,
          ),
          CustomButton(txt: 'Continue')
        ],
      ),
    );
  }
}
