import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppThemeManager extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  Color get appBarColor =>
      _isDarkMode ? Colors.black : AppColor.appBarcolor;

  Color get textColor =>
      _isDarkMode ? Colors.white : AppColor.textColorheadline1;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
