import 'package:e_commerce/controllers/network.dart';
import 'package:e_commerce/ui/just_for_you/product.card.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:flutter/material.dart';

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
      appBar: myTile(leading: const LText(text: 'Just For You')),
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
                  mainAxisExtent: 330,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  final product = data[index];

                  return ProductCard(
                    product: product,
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
