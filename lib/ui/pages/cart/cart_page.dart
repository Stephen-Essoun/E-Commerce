import 'dart:developer';

import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:e_commerce/ui/authentication/toggle_btn.dart';
import 'package:e_commerce/utils/appbar_profile_avatar.dart.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/route.dart';
import 'package:e_commerce/utils/widgets/bottom_bar.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth.dart';
import '../../../utils/alert_dialog.dart';
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
        trailing: const UserAppBarProfile(),
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
                  child: bottomBar(context, Consumer<AddToCartProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      final ValueNotifier<double?> totalPrice =
                          ValueNotifier(null);
                      for (var element in value.cart) {
                        totalPrice.value =
                            (element.price * element.quantity.value) +
                                (totalPrice.value ?? 0);
                      }
                      return ValueListenableBuilder<double?>(
                          valueListenable: totalPrice,
                          builder: (context, val, child) {
                            return Column(
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
                                        'GHC ${val?.toStringAsFixed(2) ?? '0'}')
                              ],
                            );
                          });
                    },
                  ),
                      ElevatedButton(
                        onPressed: () {
                          if (user != null) {
                            //if user's account isn't verified
                            if (!user.emailVerified) {
                              log('${user.emailVerified}');
                              alertDialog(
                                  context: context,
                                  title: 'Authentication',
                                  content: "User's account is\nnot verified",
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                          context, emailVerifyRoute));
                            }
                            //if user's account is verified
                            else if (user.emailVerified) {
                              context.read<AddToCartProvider>().emptyList();
                              context.read<CartCounterProvider>().setToZero();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar('Successfully checked out!'));
                            }
                          }
                          //if not account is available on the device
                          else {
                            alertDialog(
                                context: context,
                                title: 'Authentication',
                                content:
                                    "Only signed in users\ncan check out.\nContinue to create or\nsign in",
                                onPressed: () => Navigator.pushReplacementNamed(
                                    context, toggleBetweenUIRoute));
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
