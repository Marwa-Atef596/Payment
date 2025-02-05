// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'CustomButtonBlocConsumer.dart';
import 'payment_methods.dart';

class PaymentMethodBottomSheet extends StatefulWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  State<PaymentMethodBottomSheet> createState() =>
      _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

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
          PaymentMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(
            isPaypal: isPaypal,
          )
        ],
      ),
    );
  }
}
