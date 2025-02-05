import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/presentaion/manager/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentaion/views/widget/thank_you_view.dart';

import '../../../../../core/widget/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

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
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(amount: '100', currency: 'usd');
              BlocProvider.of<PaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: state is PaymentLoading ? true : false,
            txt: 'Continue');
      },
    );
  }
}
