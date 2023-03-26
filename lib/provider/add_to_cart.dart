import 'package:e_commerce/model/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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

  void setToZero() {
    _totalPrice = 0;
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    notifyListeners();
  }

  void reduceTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    notifyListeners();
  }
}
