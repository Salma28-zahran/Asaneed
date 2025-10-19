




import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier {
  String? _selectedFont;
/*
  MyProvider() {
    _selectedFont = _defaultFont;
  }

 */

 // String get selectedFont => _selectedFont ?? _defaultFont;

  void setSelectedFont(String font) {
    _selectedFont = font;
    notifyListeners();
  }
}