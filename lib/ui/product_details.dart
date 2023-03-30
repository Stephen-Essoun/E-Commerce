import 'package:e_commerce/model/cart.dart';
import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:e_commerce/ui/pages/cart/cart_page.dart';
import 'package:e_commerce/ui/pages/main_page.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/bottom_bar.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/widgets/badge.dart';
import '../utils/widgets/small_text.dart';

class ProductDetails extends StatefulWidget {
  final String title;
  final int id;
  final dynamic image;
  final int price;
  final String description;
  const ProductDetails(
      {super.key,
      required this.id,
      required this.image,
      required this.price,
      required this.title,
      required this.description});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          foregroundColor: black,
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: wallPadding),
                child: ValueListenableBuilder(
                    valueListenable: OnTap(),
                    builder: (context, val, _) {
                      return GestureDetector(
                          onTap: () {
                            OnTap().whenTapped(1);
                            Navigator.of(context).pop();
                          },
                          child: CartBadge());
                    }),
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
                LText(
                  text: 'GHC ${widget.price}',
                  fontSize: 18,
                )
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      visible == true ? mainColor : null),
                  backgroundColor:
                      MaterialStateProperty.all(visible == true ? grey : null)),
              onPressed: visible == false
                  ? () {
                      // context.read<CartCounter>().counterAdd();
                      context.read<AddToCartProvider>().addToCart(
                            Cart(
                              id: widget.id,
                              image: widget.image,
                              price: widget.price,
                              title: widget.title,
                              quantity: ValueNotifier(1),
                            ),
                          );
                     

                      setState(() {
                        visible = true;
                      });
                    }
                  : null,
              child: Text(visible == true ? 'Product added' : 'Add to cart'),
            )));
  }
}
