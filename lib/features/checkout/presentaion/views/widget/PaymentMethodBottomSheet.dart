import 'package:flutter/material.dart';

import '../../../../../core/widget/custom_button.dart';
import 'CustomButtonBlocConsumer.dart';
import 'payment_methods.dart';

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
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}

