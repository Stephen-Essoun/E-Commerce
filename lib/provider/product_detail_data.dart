import 'package:flutter/cupertino.dart';

class ProductDetailsProvider extends ChangeNotifier {
  String? _title, _price, _description;
  dynamic _image;

  String get title => _title!;
  dynamic get image => _image!;
  String get price => _price!;
  String get description => _description!;

  void transferData(title, image, price, description) {
    _title = title;
    _description = description;
    _image = image[0];
    _price = price;
    notifyListeners();
  }
}
