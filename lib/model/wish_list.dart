import 'package:cloud_firestore/cloud_firestore.dart';

class WishList {
  final int id;
  final String? title;
  final dynamic image;
  final int? price;
  final String? description;
  WishList({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
  });
  factory WishList.fromJson(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return WishList(
      id: data?['itemId'],
      title: data?['item Name'],
      image: data?['image'],
      price: data?['item Price'],
      description: data?['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'itemId': id,
      if (title != null) 'item Name': title,
      if (image != null) 'image': image,
      if (price != null) 'item Price': price,
      if (description != null) 'description': description,
    };
  }
}
