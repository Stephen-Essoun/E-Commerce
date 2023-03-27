class WishList {
 final int id;
 final String title;
 final dynamic image;
 final int price;
 final String description;
 final bool isFavorited;
  WishList({
    required this.id,
    required this.image,
    required this.price,
    required this.description,
    required this.title,
    required this.isFavorited
  });
}
