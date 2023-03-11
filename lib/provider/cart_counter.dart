import 'package:flutter/cupertino.dart';

class CartCounter extends ChangeNotifier {
  int _cartQuantity = 0;
  int get cartQuantity => _cartQuantity;
  counterAdd() {
    _cartQuantity++;
    notifyListeners();
  }

  counterRemove() {
    _cartQuantity--;
    notifyListeners();
  }
}
