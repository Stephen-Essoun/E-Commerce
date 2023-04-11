import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controllers/api.dart';
import 'package:e_commerce/controllers/network.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/progress_inducator.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/small_text.dart';

class JustForYou extends StatefulWidget {
  const JustForYou({super.key});

  @override
  State<JustForYou> createState() => _JustForYouState();
}

class _JustForYouState extends State<JustForYou> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myTile(leading: LText(text: 'Just For You')),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  // childAspectRatio: 1,
                  mainAxisExtent: 215,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  final product = data[index];
                  return productCard(product);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Card productCard(product) {
    return Card(
        child: Stack(
      children: [
        CachedNetworkImage(
          imageUrl: product.images[0],
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
        Positioned(
          top: 95,
          left: 10,
          child: InkWell(
            onTap: () {},
            child: const Icon(Icons.favorite_border_outlined),
          ),
        ),
        Positioned(
          top: 130,
          left: 10,
          child: SText(text: product.title),
        ),
        Positioned(
          top: 145,
          left: 10,
          child: MText(
            text: 'GHC ${500}',
          ),
        ),
        Positioned.fill(
          top: 165,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Add to cart'),
          ),
        )
      ],
    ));
  }
}
