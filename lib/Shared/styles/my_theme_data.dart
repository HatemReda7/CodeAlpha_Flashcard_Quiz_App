import 'package:flutter/material.dart';
import '/Shared/styles/colors.dart';

class MyThemeData {
  static ThemeData darkTheme = ThemeData(
      primaryColor: darkPrimaryColor,
      cardColor: darkGreyColor,
      indicatorColor: Colors.white,
      shadowColor: Colors.black,
      scaffoldBackgroundColor: darkSecondaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: Colors.white,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(elevation: 0, color: darkGreyColor));
}