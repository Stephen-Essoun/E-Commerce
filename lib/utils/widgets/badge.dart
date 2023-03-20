// import 'package:js';

import 'package:badges/badges.dart';
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/add_to_cart.dart';
import '../constant/colors.dart';
import '../../ui/pages/cart/cart_tile.dart';

class CartBadge extends StatelessWidget {
  CartBadge({
    Key? key,
  }) : super(key: key);
  final CartTileState counter = CartTileState();
  @override
  Widget build(BuildContext context) {
    return Badge(
        showBadge:
            context.watch<AddToCartProvider>().cart.isEmpty ? false : true,
        badgeStyle: BadgeStyle(
            badgeColor: white, borderRadius: BorderRadius.circular(9)),
        badgeContent: Text(
            ' ${context.watch<AddToCartProvider>().cart.length + context.watch<CartCounterProvider>().cartQuantity}'),
        child: const Icon(Icons.shopping_cart_outlined));
  }
}
