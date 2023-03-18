import 'package:flutter/cupertino.dart';

class IsFavoritedProvider extends ChangeNotifier {
  bool _isFavorited = true;
  bool get isFavorited => _isFavorited;
  setIsFavorited(isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}
