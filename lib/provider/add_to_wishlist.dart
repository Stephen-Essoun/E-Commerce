import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/wish_list.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;
  final List<WishList> _list = [];
  List<WishList> get wishList => _list;
  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;

  addToWishList(WishList product, int index) async {
    if (_list.any((element) => index == element.id)) {
      _list.removeWhere((element) => index == element.id);
      log('remove');
    } else {
      await _db
          .collection('wishList')
          .add(product.toJson())
          .whenComplete(() => log('wishList => firestore'));
      _list.add(product);
      log('added');
    }
    notifyListeners();
  }

  favorite(bool yesOrNo) {
    _isFavorited = yesOrNo;
    notifyListeners();
  }

  removeFromWishList(int index) {
    _list.removeAt(index);
    _isFavorited = false;
    notifyListeners();
  }
}
