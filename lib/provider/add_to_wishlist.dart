import 'package:e_commerce/model/wish_list.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  final List<WishList> _list = [];
  List<WishList> get wishList => _list;
  addToWishList(WishList product) {
    _list.add(product);
    notifyListeners();
  }

  void removeFromWishList(int index) {
    _list.removeAt(index);
    notifyListeners();
  }
}
