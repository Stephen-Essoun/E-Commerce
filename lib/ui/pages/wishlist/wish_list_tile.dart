import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/provider/wishlist.dart';
import 'package:e_commerce/utils/snackbar.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/cart.dart';
import '../../../model/wish_list.dart';
import '../../../provider/cart.manager.dart';
import '../../product_details.dart';
import '../../../utils/constant/colors.dart';

class WishListTile extends StatefulWidget {
  const WishListTile(
      {Key? key,
      required this.product,
      required this.i,
      required this.context,
      required this.id})
      : super(key: key);

  final WishList product;
  final int i;
  final String id;
  final BuildContext context;

  @override
  State<WishListTile> createState() => _WishListTileState();
}

class _WishListTileState extends State<WishListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: widget.i == 0 ? 10 : 0,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => ProductDetails(
                    id: widget.i,
                    image: widget.product.image!,
                    description: widget.product.description!,
                    title: widget.product.title!,
                    price: widget.product.price!),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image!,
                        progressIndicatorBuilder: (context, url, progress) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            color: secondColor,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: imageProvider,
                            ),
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MText(
                        text: widget.product.title!,
                        overflow: TextOverflow.ellipsis,
                      ),
                      MText(text: 'GHC ${widget.product.price}'),
                      ElevatedButton(
                          onPressed: () {
                            context.read<CartManagerProvider>().addToCart(
                                Cart(
                                    id: widget.i,
                                    image: widget.product.image,
                                    price: widget.product.price!,
                                    title: widget.product.title!,
                                    quantity: ValueNotifier(1)),
                                    widget.i);

                            context
                                .read<WishListProvider>()
                                .deleteProduct(widget.id);
                            showSnackBar(context, 'wishList updated');
                          },
                          child: const Text('Add to cart'))
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          context
                              .read<WishListProvider>()
                              .deleteProduct(widget.id);
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )))
              ],
            ),
          ),
        ),
        widget.i == context.watch<WishListProvider>().wishList.length - 1
            ? const SizedBox()
            : const Divider(
                color: secondColor,
              ),
      ],
    );
  }
}
