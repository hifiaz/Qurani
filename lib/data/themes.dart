import 'package:flutter/material.dart';

enum MyTheme { light, dark }

class ThemeNotifier with ChangeNotifier {
  static bool _darkmode = false;
  static List<ThemeData> themes = [
    ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xffeaf0fe)),
    ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
      canvasColor: Colors.black,
    ),
  ];

  MyTheme _current = MyTheme.light;
  ThemeData _currentTheme = themes[0];

  void switchTheme(newValue) {
    darkmode = newValue;
    currentTheme == MyTheme.light
        ? currentTheme = MyTheme.dark
        : currentTheme = MyTheme.light;
  }

  set currentTheme(theme) {
    if (theme != null) {
      _current = theme;
      _currentTheme = _current == MyTheme.light ? themes[0] : themes[1];
      notifyListeners();
    }
  }

  set darkmode(newvValue) {
    _darkmode = newvValue;
    notifyListeners();
  }

  get currentTheme => _current;
  get curretThemeData => _currentTheme;
  get darkmode => _darkmode;
}
