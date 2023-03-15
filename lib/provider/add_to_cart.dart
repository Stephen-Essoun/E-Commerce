import 'package:e_commerce/model/cart.dart';
import 'package:flutter/cupertino.dart';

class AddToCartProvider extends ChangeNotifier {
  final List<Cart> _cart = [];
  List<Cart> get cart => _cart;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  void addToCart(Cart cart) {
    _cart.add(cart);
    notifyListeners();
  }

  void emptyList() {
    _cart.clear();
    _totalPrice = 0;
    notifyListeners();
  }

  void removeFromCart(int cartIndex) {
    _cart.removeAt(cartIndex);
    notifyListeners();
  }
void setToZero(){
  _totalPrice = 0;
  notifyListeners()
;}
  void addTotalPrice(String productPrice) {
    _totalPrice = _totalPrice + double.parse(productPrice);
    notifyListeners();
  }

  void removeTotalPrice(String productPrice) {
    _totalPrice = _totalPrice - double.parse(productPrice);
    notifyListeners();
  }
}
