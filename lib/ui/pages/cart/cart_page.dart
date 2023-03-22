import 'dart:developer';

import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/widgets/bottom_bar.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/widgets/appbar.dart';
import '../../../utils/widgets/big_text.dart';
import 'cart_tile.dart';
import '../../../utils/widgets/small_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<AddToCartProvider>();
    var user = context.watch<Authentication>().user;

    return Scaffold(
      appBar: myTile(
        leading: LText(text: 'My Cart'),
        trailing: GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: secondColor,
            child: Placeholder(
                child: MText(
              text: 'user',
              color: white,
            )),
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
                          LText(
                              overflow: TextOverflow.clip,
                              text:
                                  'GHC ${context.watch<AddToCartProvider>().totalPrice}')
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (user != null) {
                            if (!user.emailVerified) {
                              log('${user.emailVerified}');
                            } else if (user.emailVerified) {
                              context.read<AddToCartProvider>().emptyList();
                              context.read<CartCounterProvider>().setToZero();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar('Successfully checked out!'));
                            }
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => const ToggleBetweenUi()));
                          }
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
