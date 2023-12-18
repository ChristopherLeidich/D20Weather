import 'package:flutter/material.dart';

/*class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}*/

class ThemeClass{
  Color lightPrimaryColor = const Color(0xABA7A4A1);
  Color lightBackgroundColor = const Color(0xFFDED6AF);
  Color darkPrimaryColor = const Color(0xFF480032);
  Color secondaryColor = const Color(0xFFFF8B6A);
  Color accentColor = const Color(0xFFFFD2BB);

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
    colorScheme: const ColorScheme.light().copyWith(
      background: _themeClass.lightBackgroundColor,
      primary: _themeClass.lightPrimaryColor,
      secondary: _themeClass.secondaryColor
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.pink),
    colorScheme: const ColorScheme.dark().copyWith(
        primary: _themeClass.darkPrimaryColor,
        secondary: _themeClass.secondaryColor
    ),
  );
}

ThemeClass _themeClass = ThemeClass();