// import 'package:js';

import 'package:badges/badges.dart';
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constant/colors.dart';
import 'cart_tile.dart';

class CartBadge extends StatelessWidget {
  CartBadge({
    Key? key,
  }) : super(key: key);
  final CartTileState counter = CartTileState();
  @override
  Widget build(BuildContext context) {
    return Badge(
        showBadge: context.read<CartCounter>().cartQuantity <= 0 ? false : true,
        badgeStyle: BadgeStyle(
            badgeColor: scaffold, borderRadius: BorderRadius.circular(9)),
        badgeContent: Text(
            ' ${context.watch<CartCounter>().cartQuantity + context.watch<CartCounter>().cartQuantityAtIndex}'),
        child: const Icon(Icons.shopping_cart_outlined));
  }
}
