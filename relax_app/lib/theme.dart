import 'package:flutter/material.dart';


Color mainBackground = const Color(0xff252738);
const Color mainDark = const Color(0xff1e1f2e);
const Color appBarBackground = Colors.transparent;
const Color iconPrimary = Colors.white;

ThemeData themeApp() {
  return ThemeData(
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white
      )
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: mainDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: mainBackground
      )
    ),
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

