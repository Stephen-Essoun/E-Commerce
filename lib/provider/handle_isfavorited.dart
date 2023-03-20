import 'package:flutter/cupertino.dart';

class IsFavoritedProvider extends ChangeNotifier {
  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;
  setIsFavorited(isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}
