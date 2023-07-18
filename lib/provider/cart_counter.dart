import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class CartCounterProvider extends ChangeNotifier {
  int _cartQuantity = 0;
  int get cartQuantity => _cartQuantity;
  final box = Hive.box<int>('cartQuantity');

  getCartQuantity() => {
      _cartQuantity = box.get('cartQuantity')??0
      };

  counterAdd() {
    _cartQuantity++;
    box.put('cartQuantity', _cartQuantity);
    notifyListeners();
  }

  void setToZero() {
    _cartQuantity = 0;
    box.put('cartQuantity', _cartQuantity);
    notifyListeners();
  }

  counterReduce() {
    _cartQuantity > 0 ? _cartQuantity-- : null;
    box.put('cartQuantity', _cartQuantity);
    notifyListeners();
  }
}
