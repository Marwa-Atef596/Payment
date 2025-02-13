import 'package:flutter/material.dart';

import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';
import 'thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(clipBehavior: Clip.none, children: [
        ThankYouCard(),
        Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CustomCheckIcon()),
        Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: CustomDashedLine())
      ]),
    );
  }
}





