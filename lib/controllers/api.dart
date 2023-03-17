// To parse this JSON data, do

//     final shop = shopFromJson(jsonString);

import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
    Shop({
        required this.status,
        required this.requestId,
        required this.data,
    });

    String status;
    String requestId;
    Data data;

    factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        status: json["status"],
        requestId: json["request_id"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.asin,
        required this.country,
        required this.productOffers,
    });

    String asin;
    String country;
    List<ProductOffer> productOffers;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        asin: json["asin"],
        country: json["country"],
        productOffers: List<ProductOffer>.from(json["product_offers"].map((x) => ProductOffer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "asin": asin,
        "country": country,
        "product_offers": List<dynamic>.from(productOffers.map((x) => x.toJson())),
    };
}

class ProductOffer {
    ProductOffer({
        required this.productPrice,
        required this.productCondition,
        required this.shipsFrom,
        required this.seller,
        required this.sellerLink,
        required this.sellerStarRating,
        required this.sellerStarRatingInfo,
        required this.currency,
        this.productConditionDetails,
    });

    String productPrice;
    ProductCondition productCondition;
    String shipsFrom;
    String seller;
    String sellerLink;
    String sellerStarRating;
    String sellerStarRatingInfo;
    Currency currency;
    String? productConditionDetails;

    factory ProductOffer.fromJson(Map<String, dynamic> json) => ProductOffer(
        productPrice: json["product_price"],
        productCondition: productConditionValues.map[json["product_condition"]]!,
        shipsFrom: json["ships_from"],
        seller: json["seller"],
        sellerLink: json["seller_link"],
        sellerStarRating: json["seller_star_rating"],
        sellerStarRatingInfo: json["seller_star_rating_info"],
        currency: currencyValues.map[json["currency"]]!,
        productConditionDetails: json["product_condition_details"],
    );

    Map<String, dynamic> toJson() => {
        "product_price": productPrice,
        "product_condition": productConditionValues.reverse[productCondition],
        "ships_from": shipsFrom,
        "seller": seller,
        "seller_link": sellerLink,
        "seller_star_rating": sellerStarRating,
        "seller_star_rating_info": sellerStarRatingInfo,
        "currency": currencyValues.reverse[currency],
        "product_condition_details": productConditionDetails,
    };
}

// ignore: constant_identifier_names
enum Currency { USD }

final currencyValues = EnumValues({
    "USD": Currency.USD
});

// ignore: constant_identifier_names
enum ProductCondition { EXCELLENT_CONDITION_REFURBISHED, ACCEPTABLE_CONDITION_REFURBISHED, GOOD_CONDITION_REFURBISHED }

final productConditionValues = EnumValues({
    "Acceptable condition (Refurbished)": ProductCondition.ACCEPTABLE_CONDITION_REFURBISHED,
    "Excellent condition (Refurbished)": ProductCondition.EXCELLENT_CONDITION_REFURBISHED,
    "Good condition (Refurbished)": ProductCondition.GOOD_CONDITION_REFURBISHED
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}




class Product {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
