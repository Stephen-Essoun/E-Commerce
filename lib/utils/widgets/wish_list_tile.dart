import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class WishListTile extends StatelessWidget {
  const WishListTile({Key? key, required this.items, required this.i})
      : super(key: key);

  final List items;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration:const BoxDecoration(
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(widget.cart.image[0]),
                        // ),
                        ),
                    child: const Center(child: Text('image'))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(text: 'text'),
                  MText(text: 'text'),
                  ElevatedButton(onPressed: () {}, child: const Text('Add to cart'))
                ],
              ),
            ],
          ),
        ),
        i == items.length - 1
            ? const Text('')
            : const Divider(
                color: secondColor,
              ),
      ],
    );
  }
}
