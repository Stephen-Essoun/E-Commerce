import 'package:e_commerce/model/cart.dart';
import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/widgets/bottom_bar.dart';
import 'package:e_commerce/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/appbar.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    // var provider = context.read<ProductDetailsProvider>();
    var provider = context.read<AddToCartProvider>();

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
                        return cartTile(cart, context);
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
                        onPressed: () {},
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

  ListTile cartTile(Cart cart, BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
      dense: true,
      leading: Container(
          height: 150,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(cart.image[0]),
            ),
          )),
      title: MText(
        text: cart.title,
        overflow: TextOverflow.clip,
      ),
      subtitle: MText(text: 'GHC ${cart.price}'),
      trailing: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: Row(
            children: [
              const Card(
                  child: Icon(
                Icons.remove_circle,
                color: mainColor,
              )),
              MText(text: '100'),
              const Card(
                child: Icon(
                  Icons.add_circle,
                  color: mainColor,
                ),
              )
            ],
          )),
    );
  }
}
