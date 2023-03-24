import 'dart:developer';

import 'package:flutter/cupertino.dart';

class CartCounterProvider extends ChangeNotifier {
  int _cartQuantity = 0;
  int get cartQuantity => _cartQuantity;

  counterAdd() {
    _cartQuantity++;
    notifyListeners();
  }

  void setToZero() {
    _cartQuantity = 0;
    notifyListeners();
  }

  counterReduce() {
    _cartQuantity > 0 ? _cartQuantity-- : null;
    notifyListeners();
  }
}
//80     18  12 