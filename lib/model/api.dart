// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

List<Store> storeFromJson(String str) =>
    List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store {
  int id;
  String title;
  double price;
  String description;
  Category category;
  String image;
  Rating rating;

  Store({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse[category],
        "image": image,
        "rating": rating.toJson(),
      };
}

// ignore: constant_identifier_names
enum Category { MENS_CLOTHING, JEWELERY, ELECTRONICS, WOMENS_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.MENS_CLOTHING,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.ELECTRONICS,
  "women's clothing": Category.WOMENS_CLOTHING
});

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
