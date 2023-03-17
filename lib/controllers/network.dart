import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/controllers/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Product> parseShop(String responseBody) {
  final list = json.decode(responseBody) as List<dynamic>;
  List<Product> shop = list.map((e) => Product.fromJson(e)).toList();
  return shop;
}

String url = "https://api.escuelajs.co/api/v1/products";
Future<List<Product>> getProducts() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(parseShop, response.body);
  } else {
    throw Exception("Failed to get data from $url");
  }
}

//  void fetchProducts()async{}