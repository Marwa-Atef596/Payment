// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/repos/Checkout_Repo_impl.dart';
import 'package:payment/features/checkout/presentaion/manager/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentaion/views/widget/order_info_item.dart';
import 'package:payment/features/checkout/presentaion/views/widget/total_price.dart';

import '../../../../../core/widget/custom_button.dart';
import 'PaymentMethodBottomSheet.dart';

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
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: PaymentMethodBottomSheet(),
                    );
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
