import 'dart:convert';
import 'package:e_commerce/model/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

List<Shop> parseShop(String responseBody) {
  final list = json.decode(responseBody) as List<dynamic>;
  List<Shop> shop = list.map((e) => Shop.fromJson(e)).toList();
  return shop;
}

String url = "https://api.escuelajs.co/api/v1/products";
Future<List<Shop>> getProducts() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(parseShop, response.body);
  } else {
    throw Exception("Failed to get data from $url");
  }
}

//  Store parseShop(String responseBody) {
//   final list = json.decode(responseBody) as List<dynamic>;
//   Store shop = list.map((e) => st(e)).toList();
//   return shop;
// }
// Future<List<Store>> getProducts() async {
//   final url = Uri.parse('https://api.escuelajs.co/api/v1/products');
//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     return storeFromJson(response.body) ;
//   } else {
//     throw Exception("couldn't get $url");
//   }
// }

void fetchProducts() async {}
