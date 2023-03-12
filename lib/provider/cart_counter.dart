import 'package:flutter/cupertino.dart';

class CartCounter extends ChangeNotifier {
  int _cartQuantity = 0;
  int _cartQuantityAtIndex = 1;
  int get cartQuantity => _cartQuantity;
  int get cartQuantityAtIndex => _cartQuantityAtIndex;

  counterAdd() {
    _cartQuantity++;
    notifyListeners();
  }

  counterAddAtIndex(int id) {
    id != 0 ? _cartQuantityAtIndex++ : null;
  }

  counterReduce() {
    _cartQuantity > 0 ? _cartQuantity-- : null;
    notifyListeners();
  }
}
//80     18  12 