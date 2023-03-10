import 'package:e_commerce/provider/add_to_cart.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/widgets/bottom_bar.dart';
import 'package:e_commerce/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controllers/add_to_cart.dart';
import '../../provider/product_detail_data.dart';
import '../../widgets/appbar.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

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
        LText(text: 'Cart'),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: secondColor,
            child: Icon(Icons.person),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: provider.cart.length,
          itemBuilder: (context, index) {
            var cart = provider.cart[index];
            return ListTile(
              leading: Container(
                  height: 150,
                  width: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(cart.image[0]),
                    ),
                  )),
              title: MText(text: cart.title),
              subtitle: MText(text: 'GHC ${cart.price}'),
            );
          }
          // Spacer(),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: bottomBar(
          //       context,
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           SText(text: 'Cart total:'),
          //           LText(text: 'GHC ${provider.price}')
          //         ],
          //       ),
          //       'Checkout',
          //       () {}),
          // ),
          ),
    );
  }
}
