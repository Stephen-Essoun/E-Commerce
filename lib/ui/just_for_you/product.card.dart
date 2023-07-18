import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/api.dart';
import '../../model/wish_list.dart';
import '../../provider/wishlist.dart';
import '../../utils/widgets/medium_text.dart';
import '../../utils/widgets/small_text.dart';
import '../pages/wishlist/handle.favorite.ontapped.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final Store product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    super.initState();
    context.read<WishListProvider>().favPro(widget.product.id.toString());
  }

  // @override
  // didChangeDependencies() {
  //   super.didChangeDependencies();
  //   //to toglle btn favorited and unfavorited icon
  //   context.watch<WishListProvider>().favPro(widget.id.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: widget.product.image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Colors.red,
                    BlendMode.colorBurn,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SText(
            text: widget.product.title,
            overflow: TextOverflow.clip,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MText(
            text: 'GHC ${widget.product.price}',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                print(widget.product.id);
              },
              child: const Text('Add to cart'),
            ),
            Builder(builder: (context) {
              var wishList = WishList(
                id: widget.product.id,
                image: widget.product.image,
                price: widget.product.price.toInt(),
                description: widget.product.description,
                title: widget.product.title,
              );
              return FavoriteButton(id: widget.product.id, wishList: wishList);
            })
          ],
        ),
      ],
    ));
  }
}
