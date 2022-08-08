import 'package:flutter/material.dart';


const Color mainBackground = const Color(0xff252738);
const Color appBarBackground = Colors.transparent;
const Color iconPrimary = Colors.white;

ThemeData themeApp() {

  return ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
        )),
    appBarTheme: AppBarTheme(
      backgroundColor: appBarBackground,
      elevation: 0,
    ),
    scaffoldBackgroundColor: mainBackground,
  );
}

AppBar CustomAppBar(header) {
  String text = header;

   return AppBar(
      centerTitle: false,
      title: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ));
}