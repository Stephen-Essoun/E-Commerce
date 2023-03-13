import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/widgets/bottom_bar.dart';
import 'package:e_commerce/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/snackbar.dart';
import '../widgets/appbar.dart';
import '../widgets/big_text.dart';
import '../widgets/cart_tile.dart';
import '../widgets/small_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    // var provider = context.read<ProductDetailsProvider>();
    var provider = context.watch<AddToCartProvider>();

    return Scaffold(
      appBar: appBar(
        LText(text: 'My Cart'),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: secondColor,
            child: Icon(Icons.person),
          ),
        ),
      ),
      body: provider.cart.isEmpty
          ? Center(child: MText(text: 'No added products to show'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: provider.cart.length,
                      itemBuilder: (context, index) {
                        var cart = provider.cart[index];
                        return CartTile(i: index, cart: cart, context: context);
                      }),
                ),
                Visibility(
                  visible: provider.cart.isEmpty ? false : true,
                  child: bottomBar(
                      context,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SText(
                            text: 'Cart total:',
                            fontSize: 15,
                          ),
                          LText(text: 'GHC 200')
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar('Successfully checked out!'));
                        },
                        child: const Text('Checkout'),
                      )),
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
    );
  }
}
