import 'package:cloud_firestore/cloud_firestore.dart';

class WishList {
  final String? title;
  final List<String>? image;
  final int? price;
  final String? description;
  WishList({
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
      title: data?['item Name'],
      image: List<String>.from(data?['image']),
      price: data?['item Price'],
      description: data?['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'item Name': title,
      if (image != null) 'image': image,
      if (price != null) 'item Price': price,
      if (description != null) 'description': description,
    };
  }
}
