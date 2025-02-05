import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentaion/views/widget/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> listItem = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listItem.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
                widget.updatePaymentMethod(index: activeIndex);
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                imge: listItem[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
