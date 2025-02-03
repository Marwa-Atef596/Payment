// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/styles.dart';

AppBar CustomAppBar({final String? title}) {
    return AppBar(
      leading: Center(
        child: SvgPicture.asset('assets/images/arrow.svg'),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title??'',
        style: Styles.style25,
        textAlign: TextAlign.center,
      ),
    );
  }