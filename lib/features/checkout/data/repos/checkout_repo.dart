import 'package:dartz/dartz.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';

import '../../../../core/errors/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
