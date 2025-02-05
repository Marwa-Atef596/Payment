// ignore_for_file: file_names, avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/data/models/amount/amount.model.dart';
import 'package:payment/features/checkout/data/models/amount/details.model.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment/features/checkout/presentaion/manager/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentaion/views/my_cart.dart';
import 'package:payment/features/checkout/presentaion/views/widget/thank_you_view.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../../data/models/payment_intent_input_model/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onPressed: () {
              if (isPaypal) {
                var transactionData = getTransactionData();
                excutePaypalPayment(context, transactionData);
              } else {
                excuteStripePayment(context);
              }
              // // excuteStripePayment(context);
              // var transactionData = getTransactionData();
              // excutePaypalPayment(context, transactionData);
            },
            isLoading: state is PaymentLoading ? true : false,
            txt: 'Continue');
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'usd',
      customerId: 'cus_RibaNmPf0CO3Au',
    );
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void excutePaypalPayment(BuildContext context,
      ({Amount amountModel, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionData.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankYouView();
            }),
            (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const MyCart();
            }),
            (route) {
              return false;
            },
          );
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({Amount amountModel, ItemListModel itemList}) getTransactionData() {
    var amountModel = Amount(
      total: '100',
      currency: 'USD',
      details: Details(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: '100',
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'apple',
        price: '4',
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'apple',
        price: '5',
        quantity: 12,
      ),
    ];
    var itemList = ItemListModel(orders: orders);
    return (amountModel: amountModel, itemList: itemList);
  }
}
