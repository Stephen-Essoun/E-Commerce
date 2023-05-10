import 'package:badges/badges.dart' as badge;
import 'package:e_commerce/provider/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/cart.manager.dart';
import '../constant/colors.dart';
import '../../ui/pages/cart/cart_tile.dart';

class CartBadge extends StatelessWidget {
  CartBadge({
    Key? key,
  }) : super(key: key);
  final CartTileState counter = CartTileState();
  @override
  Widget build(BuildContext context) {
    return badge.Badge(
        showBadge:
            context.watch<CartManagerProvider>().cartBox.isEmpty ? false : true,
        badgeStyle: badge.BadgeStyle(
            badgeColor: white, borderRadius: BorderRadius.circular(9)),
        badgeContent: Text(
            ' ${context.watch<CartManagerProvider>().cartBox.length + context.watch<CartCounterProvider>().cartQuantity}'),
        child: const Icon(Icons.shopping_cart_outlined));
  }
}
