import 'package:flutter/cupertino.dart';

class Cart {
 final int id;
  String title;
  dynamic image;
  int price;
  ValueNotifier<int> quantity = ValueNotifier(1);
  Cart( {
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.quantity,
  });
}
