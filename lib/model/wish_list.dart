class WishList {
  String title;
  dynamic image;
  String price;
  String description;
  bool isFavorited;
  WishList({
    required this.image,
    required this.price,
    required this.description,
    required this.title,
    required this.isFavorited
  });
}
