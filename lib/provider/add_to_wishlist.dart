import 'dart:developer';

import 'package:e_commerce/model/wish_list.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  final List<WishList> _list = [];
  List<WishList> get wishList => _list;
  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;

  addToWishList(WishList product, int index) {
    if (_list.isNotEmpty) {
      _list.removeWhere((element) => index == element.id);
      _isFavorited = false;
      log('remove');
    } else {
      _list.add(product);
      _isFavorited = true;
      log('added');
    }
    notifyListeners();
  }

  removeFromWishList(int index) {
    _list.removeAt(index);
    notifyListeners();
  }
}
