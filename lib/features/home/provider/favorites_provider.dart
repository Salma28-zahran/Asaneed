import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Widget> favoriteHadiths = [];
  final List<Widget> favoriteRuwaa = [];
  final List<Widget> favoriteSeries = [];

  void addToFavoritesRuwaa(Widget item) {
    favoriteRuwaa.add(item);
    notifyListeners();
  }

  void addToFavoritesHadiths(Widget item) {
    favoriteHadiths.add(item);
    notifyListeners();
  }

  void addToFavoritesSeries(Widget item) {
    favoriteSeries.add(item);
    notifyListeners();
  }
}
