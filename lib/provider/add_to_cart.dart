import 'package:e_commerce/model/cart.dart';
import 'package:flutter/cupertino.dart';

class AddToCartProvider extends ChangeNotifier {
  
  final List<Cart> _cart = [];
  List<Cart> get cart => _cart;
  void addToCart(Cart cart) {
    _cart.add(cart);
    notifyListeners();
  }

  void removeFromCart(Cart cart) {
    _cart.remove(cart);
    notifyListeners();
  }
}
