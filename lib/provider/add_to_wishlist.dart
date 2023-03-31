import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/wish_list.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  List _list = [];
  get wishList => _list;
  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;

  addProduct(WishList product) {
    final wishlist = _db.collection('wishList');
    wishlist
        .withConverter(
          fromFirestore: WishList.fromJson,
          toFirestore: (value, options) => value.toJson(),
        )
        .add(product);
    notifyListeners();
  }

  getProducts() async {
    final docRef = _db.collection('wishList');
    final dbRef = docRef.withConverter(
      fromFirestore: WishList.fromJson,
      toFirestore: (value, options) => value.toJson(),
    );
    final docSnap = await dbRef.get();
    final wishlist = docSnap.docs;
    _list = wishList;
    if (wishlist.isNotEmpty) {
      log('${wishlist.asMap()}');
    }
    notifyListeners();
  }

  addToWishList(WishList product, int index) async {
    if (_list.any((element) => index == element.id)) {
      _list.removeWhere((element) => index == element.id);
      log('remove');
    } else {
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
