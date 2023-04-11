import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/wish_list.dart';
import 'package:flutter/cupertino.dart';

import 'auth.dart';

class WishListProvider extends ChangeNotifier {
  final db = FirebaseFirestore.instance
      .collection('wishList')
      .doc(Authentication().user?.email)
      .collection('favorite');
  final List<WishList> _list = [];
  List<WishList> get wishList => _list;

  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;
  String? _setId;
  get setId => _setId;
  setID(String id) {
    _setId = id;
    notifyListeners();
  }

  addProduct(WishList product, productId) {
    db
        .withConverter(
          fromFirestore: WishList.fromJson,
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(productId)
        .set(product)
        .then((value) {
      log('Created');
    });
    notifyListeners();
  }

  getProducts() {
    final ref = db.withConverter(
      fromFirestore: WishList.fromJson,
      toFirestore: (value, options) => value.toJson(),
    );
    final docSnap = ref.snapshots();
    return docSnap;
  }

  deleteProduct(index) async {
    final docRef = db.withConverter(
        fromFirestore: WishList.fromJson,
        toFirestore: (value, _) => value.toJson());
    final docSnap =
        await docRef.doc(index).delete().then((value) => log('deleted'));
    notifyListeners();
    return docSnap;
  }

  deleteWhere(productId) async {
    final ref = db.withConverter(
      fromFirestore: WishList.fromJson,
      toFirestore: (value, options) => value.toJson(),
    );
    ref.doc(productId).delete();
    notifyListeners();
  }

  favPro(id, liked) {
    getProducts().listen((snapshot) {
      snapshot.docs.any((element) => liked = element.data().id == id);
    });
    notifyListeners();
  }

  // addToWishList(WishList product, int index) async {
  //   if (_list.any((element) => index == element.id)) {
  //     _list.removeWhere((element) => index == element.id);
  //     log('remove');
  //   } else {
  //     _list.add(product);
  //     log('added');
  //   }
  //   notifyListeners();
  // }

  // favoriteProduct( id,) {
  //   final ref = db.withConverter(
  //     fromFirestore: WishList.fromJson,
  //     toFirestore: (value, options) => value.toJson(),
  //   );
  //   final docSnap = ref.snapshots();
  //   docSnap.listen((snapshot) {
  //     snapshot.docs.any((element) => _isFavorited = element.data().id == id);
  //   });
  //   notifyListeners();
  // }

  removeFromWishList(int index) {
    _list.removeAt(index);
    _isFavorited = false;
    notifyListeners();
  }
}
