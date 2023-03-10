import 'package:e_commerce/model/cart.dart';
import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/provider/product_detail_data.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/widgets/appbar.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/bottom_bar.dart';
import 'package:e_commerce/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/add_to_cart.dart';
import '../widgets/small_text.dart';

class ProductDetails extends StatelessWidget {
  String title;
  dynamic image;
  String price;
  String description;
  ProductDetails(
      {super.key,
      required this.image,
      required this.price,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<ProductDetailsProvider>();
    return Scaffold(
      body: ListView(children: [
        appBar(
          GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios)),
          GestureDetector(child: const Icon(Icons.shopping_cart_outlined)),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              color: thirdColor,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image[0]))),
        ),
        wSpacing,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: wallPadding),
          child: LText(text: title),
        ),
        wSpacing,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: wallPadding),
          child: MText(
            text: 'Description',
            fontSize: 18,
          ),
        ),
        wSpacing,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: wallPadding),
          child: SText(
            text: description,
            fontSize: 15,
            overflow: TextOverflow.clip,
          ),
        ),
      ]),
      bottomNavigationBar: bottomBar(
        context,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [SText(text: 'Price:'), LText(text: 'GHC $price')],
        ),
        'Add to cart',
        () =>Provider.of<AddToCartProvider>(context,listen: false).addToCart(
          Cart(
            image: image,
            price: price,
            title: title,
          ),
        ),
      ),
    );
  }
}
