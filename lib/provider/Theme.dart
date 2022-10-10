import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class ChangeThemes with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get currentThemeMode => _themeMode;


  void setTheme(themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }
}