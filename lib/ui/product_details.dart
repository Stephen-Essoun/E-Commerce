import 'package:e_commerce/model/cart.dart';
import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:e_commerce/ui/cart_page.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/bottom_bar.dart';
import 'package:e_commerce/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/badge.dart';
import '../widgets/small_text.dart';

class ProductDetails extends StatefulWidget {
  final String title;
  final dynamic image;
  final String price;
  final String description;
  const ProductDetails(
      {super.key,
      required this.image,
      required this.price,
      required this.title,
      required this.description});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: scaffold,
          elevation: 0,
          foregroundColor: black,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: wallPadding),
                child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartView())),
                    child: CartBadge()),
              ),
            )
          ],
        ),
        body: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                color: thirdColor,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(widget.image[0]))),
          ),
          wSpacing,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: wallPadding),
            child: LText(text: widget.title),
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
              text: widget.description,
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
              children: [
                SText(text: 'Price:'),
                LText(text: 'GHC ${widget.price}')
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CartCounter>().counterAdd();
                context.read<AddToCartProvider>().addToCart(
                      Cart(
                        image: widget.image,
                        price: widget.price,
                        title: widget.title,
                      ),
                    );
                setState(() {
                  clicked == true;
                });
              },
              child: const Text('Add to cart'),
            )));
  }
}
