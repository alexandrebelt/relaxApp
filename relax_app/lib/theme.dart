import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

// Dark atributes
Color mainBackground = const Color(0xff252738);
Color mainDark = const Color(0xff1e1f2e);
Color appBarBackground = Colors.transparent;
var defaultTheme = dark;

//Light atributes
Color mainLight = const Color(0xffcfcec4);
Color offWhite = const Color(0xffe8e7dc);
Color offWhiteDarker = const Color(0xffadad93);
Color lightBlue = const Color(0xff5D5F71);

//LIGHT

// DARK THEME

var dark = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: offWhite,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: offWhite,
    ),
    backgroundColor: appBarBackground,
    elevation: 0,
  ),
  iconTheme: IconThemeData(
    color: offWhite,
  ),
  textTheme: TextTheme(
      bodyText2: TextStyle(
          color: offWhite,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: offWhite,
    unselectedItemColor: lightBlue,
    backgroundColor: mainDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: mainBackground
      )
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: offWhite,
      )),
  scaffoldBackgroundColor: mainBackground,
  listTileTheme: ListTileThemeData(
    textColor: offWhite,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: offWhite,
  ),
);


// LIGHT THEME
var light = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: lightBlue,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(
      color: lightBlue,
    ),
    backgroundColor: appBarBackground,
    elevation: 0,
  ),
  iconTheme: IconThemeData(
    color: lightBlue,
  ),
  textTheme: TextTheme(
      bodyText2: TextStyle(
          color: lightBlue,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: lightBlue,
    unselectedItemColor: offWhiteDarker,
    backgroundColor: mainLight,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          backgroundColor: offWhite,
      )
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: mainBackground,
      )),
  scaffoldBackgroundColor: offWhite,
  listTileTheme: ListTileThemeData(
    textColor: lightBlue,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: lightBlue
  )
);



// CUSTOM APPBAR
Text CustomAppBar(header) {
  String text = header;
   return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35,
      ),
   );
}


class ThemeNotifier extends ChangeNotifier{
  final String key = "theme";
  SharedPreferences ?prefs;
  late bool _lightTheme;

  bool get lightTheme => _lightTheme;

  ThemeNotifier(){
    _lightTheme = false;
    _loadFromPrefs();
  }

  toggleTheme(){
    _lightTheme = ! _lightTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async{
    if(prefs == null)
      prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async{
    await _initPrefs();
    _lightTheme = prefs?.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async{
    await _initPrefs();
    prefs?.setBool(key, _lightTheme);
  }
}

