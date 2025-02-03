import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    this.onPressed,
  });
  final String txt;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0xff34a853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            txt,
            style: Styles.style22,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
