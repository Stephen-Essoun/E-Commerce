import 'dart:convert';
import 'package:e_commerce/model/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//from youtube
List<Store> parseShop(String responseBody) {
  final list = json.decode(responseBody) as List<dynamic>;
  List<Store> shop = list.map((e) => Store.fromJson(e)).toList();
  return shop;
}

String url = "http://fakestoreapi.com/products";
Future<List<Store>> getProducts() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(parseShop, response.body);
  } else {
    throw Exception("Failed to get data from $url");
  }
}

//from chatgtp
Future<List<Store>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    final List<Store> products = data.map((item) => Store.fromJson(item)).toList();
    return products;
  } else {
    throw Exception('Failed to fetch products');
  }
}