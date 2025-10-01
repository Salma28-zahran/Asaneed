import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Widget> favHadiths = [];

  void addHadith(Widget hadithCard) {
    favHadiths.add(hadithCard);
    notifyListeners();
  }

  void removeHadith(Widget hadithCard) {
    favHadiths.removeWhere((element) =>
    element.key == hadithCard.key);
    notifyListeners();
  }
  void removeFromFav(Widget hadithCard) {
    favHadiths.removeWhere((element) => element.key == hadithCard.key);
    notifyListeners();
  }


}
