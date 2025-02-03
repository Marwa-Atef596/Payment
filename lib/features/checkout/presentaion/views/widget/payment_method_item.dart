import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false, required this.imge,
  });
  final bool isActive;
  final String imge;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isActive ? Color(0xff34A853) : Colors.grey, width: 1.50),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
              color: isActive ? Color(0xff34A853) : Colors.white,
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0),
        ],
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Center(
            child: SvgPicture.asset(
              imge,
              //height: 24,
            ),
          )),
    );
  }
}
