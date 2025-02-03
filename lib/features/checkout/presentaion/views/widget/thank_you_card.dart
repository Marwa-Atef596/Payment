import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/presentaion/views/widget/card_info_widget.dart';
import 'package:payment/features/checkout/presentaion/views/widget/order_info_item.dart';
import 'package:payment/features/checkout/presentaion/views/widget/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Color(0xffd9d9d9)),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            Text(
              'Thank you!',
              style: Styles.style25,
              textAlign: TextAlign.center,
            ),
            Text(
              'Your transaction was successful',
              style: Styles.style20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 42,
            ),
            OrderInfoItem(
              title: 'Date',
              value: '01/24/2023',
            ),
            SizedBox(
              height: 20,
            ),
            OrderInfoItem(
              title: 'Time',
              value: '10:15 AM',
            ),
            SizedBox(
              height: 20,
            ),
            OrderInfoItem(
              title: 'To',
              value: 'Sam Louis',
            ),
            Divider(
              thickness: 1,
              height: 60,
            ),
            TotalPrice(
              title: 'Total',
              value: r'$50.97',
            ),
            SizedBox(
              height: 30,
            ),
            CardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
