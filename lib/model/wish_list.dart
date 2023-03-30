class WishList {
 final int id;
 final String title;
 final dynamic image;
 final int price;
 final String description;
  WishList({
    required this.id,
    required this.image,
    required this.price,
    required this.description,
    required this.title,
  });
  toJson(){
    return {
      'item Name' : title,
      'image' : image,
      'item Price' : price,
      'description' : description,
    };
  }
}
