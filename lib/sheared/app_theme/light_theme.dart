import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData LightTheme = ThemeData(
  primarySwatch: Colors.teal,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(color: Colors.teal, size: 25),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.teal,
    unselectedItemColor: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
        color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
  ),
);
