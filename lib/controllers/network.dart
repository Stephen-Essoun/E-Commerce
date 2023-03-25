import 'dart:convert';
import 'package:e_commerce/controllers/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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


//  Future<Shop> getProducts() async{
//   final url = Uri.parse('https://api.escuelajs.co/api/v1/products');
//   final   response = await http.get(url);
//   if(response.statusCode == 200){
//     return  shopFromJson(response.body);
//   }else{throw Exception("couldn't get $url");}
// }

//  void fetchProducts()async{}