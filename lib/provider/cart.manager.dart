
import 'package:e_commerce/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartManagerProvider extends ChangeNotifier {
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  Box<Cart> get cartBox => Hive.box<Cart>('myCarts');

  void addToCart(Cart cart,key) async {
    await cartBox.put(key,cart);
    notifyListeners();
  }

  void emptyList() {
    cartBox.deleteAll(cartBox.keys);
    _totalPrice = 0;
    notifyListeners();
  }

  void removeFromCart(int cartIndex) {
    cartBox.deleteAt(cartIndex);
    notifyListeners();
  }

  void setToZero() {
    _totalPrice = 0;
    notifyListeners();
  }

  void addTotalPrice(int productPrice) {
    _totalPrice = _totalPrice + productPrice;
    notifyListeners();
  }

  void reduceTotalPrice(int productPrice) {
    _totalPrice = _totalPrice - productPrice;
    notifyListeners();
  }
}
