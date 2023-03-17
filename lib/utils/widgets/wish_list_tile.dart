import 'package:e_commerce/provider/add_to_wishlist.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/wish_list.dart';
import '../constant/colors.dart';

class WishListTile extends StatefulWidget {
  const WishListTile(
      {Key? key, required this.product, required this.i, required this.context})
      : super(key: key);

  final WishList product;
  final int i;
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(widget.product.image[0]),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(
                      text: widget.product.title,
                      overflow: TextOverflow.ellipsis,
                    ),
                    MText(text: 'GHC ${widget.product.price}'),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Add to cart'))
                  ],
                ),
              ),
              const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ))
            ],
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
