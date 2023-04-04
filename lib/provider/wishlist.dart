import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/wish_list.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider extends ChangeNotifier {
  final db = FirebaseFirestore.instance.collection('wishList');
  bool _isEmpty = false;
  bool get isEmpty => _isEmpty;

  final List<WishList> _list = [];
  List<WishList> get wishList => _list;

  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;

  addProduct(WishList product) {
    db
        .withConverter(
          fromFirestore: WishList.fromJson,
          toFirestore: (value, options) => value.toJson(),
        )
        .add(product)
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
    log('Read');
    return docSnap;
  }

  deleteProduct(index) async {
    final docRef = db.withConverter(
        fromFirestore: WishList.fromJson,
        toFirestore: (value, _) => value.toJson());
    final docSnap =
        await docRef.doc(index).delete().then((value) => log('deleted'));

    return docSnap;
  }

  deleteWhere(id) async {
    getProducts().listen((snapshot){for(var product in snapshot ){
      if(snapshot.docs.any((element)=>element.data().id =id)){
 final docRef = db.withConverter(
        fromFirestore: WishList.fromJson,
        toFirestore: (value, _) => value.toJson());
          docRef.doc().delete();
      }
    }});
   
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

  favoriteProduct(yesOrNo) {
    _isFavorited = yesOrNo ? true : false;
    notifyListeners();
  }

  removeFromWishList(int index) {
    _list.removeAt(index);
    _isFavorited = false;
    notifyListeners();
  }
}
