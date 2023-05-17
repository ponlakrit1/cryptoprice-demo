import 'package:flutter/material.dart';

import 'package:cryptocurrency_demo/utils/style.dart';

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

ThemeData mainTheme(BuildContext context) {
  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Kanit',
  );
}