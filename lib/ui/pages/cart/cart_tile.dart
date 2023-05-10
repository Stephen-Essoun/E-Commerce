import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/cart.dart';
import '../../../provider/cart.manager.dart';
import '../../../provider/cart_counter.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/widgets/medium_text.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    Key? key,
    required this.i,
    required this.cart,
    required this.context,
  }) : super(key: key);

  final int i;
  final Cart cart;
  final BuildContext context;

  @override
  State<CartTile> createState() => CartTileState();
}

class CartTileState extends State<CartTile> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      dense: true,
      leading: Container(
          height: 150,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(widget.cart.image),
            ),
          )),
      title: MText(
        text: widget.cart.title,
        overflow: TextOverflow.clip,
      ),
      subtitle: MText(text: 'GHC ${widget.cart.price}'),
      trailing: counterMaths(context, widget.i),
    );
  }

  SizedBox counterMaths(BuildContext context, int id) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (_counter > 0) {
                  setState(() {
                    _counter--;
                    widget.cart.quantity = ValueNotifier(_counter);
                  });
                  context.read<CartCounterProvider>().counterReduce();
                  context
                      .read<CartManagerProvider>()
                      .reduceTotalPrice(widget.cart.price * _counter);
                }
                if (_counter < 1) {
                  context.read<CartManagerProvider>().removeFromCart(widget.i);
                  // context
                  //     .read<AddToCartProvider>()
                  //     .reduceTotalPrice(widget.cart.price * _counter);
                  context.read<CartCounterProvider>().counterReduce();
                }
                context.read<CartManagerProvider>().cartBox.isEmpty
                    ? context.read<CartManagerProvider>().setToZero()
                    : null;

                showSnackBar(context, 'cart successfully updated');
              },
              child: const Card(
                  child: Icon(
                Icons.remove,
                color: mainColor,
              )),
            ),
            MText(
              text: _counter.toString(),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _counter++;
                  widget.cart.quantity = ValueNotifier(_counter);
                });
                context.read<CartCounterProvider>().counterAdd();
                //increase the amount
                context
                    .read<CartManagerProvider>()
                    .addTotalPrice(widget.cart.price * _counter);
                showSnackBar(context, 'cart successfully updated');
              },
              child: const Card(
                child: Icon(
                  Icons.add,
                  color: mainColor,
                ),
              ),
            )
          ],
        ));
  }
}
