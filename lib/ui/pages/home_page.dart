import 'dart:developer';

import 'package:e_commerce/controllers/api.dart';
import 'package:e_commerce/controllers/network.dart';
import 'package:e_commerce/provider/product_detail_data.dart';
import 'package:e_commerce/ui/product_details.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/widgets/appbar.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/medium_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: ListView(
                children: [
                  appBar(
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LText(text: 'Hello Stephen!'),
                        SText(text: 'We have some options for you to consider.')
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint('response.body.toString()');
                      },
                      child: const CircleAvatar(
                        backgroundColor: secondColor,
                        child: Icon(Icons.person_add),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: wallPadding, right: wallPadding),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            filled: true,
                            labelText: 'Search here',
                            fillColor: Colors.white,
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                      )),
                      const Padding(
                        padding: EdgeInsets.only(right: wallPadding),
                        child: Icon(
                          Icons.menu,
                          color: black,
                        ),
                      )
                    ],
                  ) //search bar area
                  ,
                  //Category section
                  Container(
                    padding: const EdgeInsets.only(
                        top: wallPadding,
                        bottom: wallPadding,
                        left: wallPadding),
                    height: MediaQuery.of(context).size.height / 4,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LText(text: 'Categories'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: wallPadding),
                              child: SText(text: 'view all'),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: wallPadding,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  var category = snapshot.data![i].category!;
                                  return categoriesItem(i, category.image,
                                      category.name.toString());
                                }))
                      ],
                    ),
                  ),
                  //just_for_you section
                  Container(
                    padding: const EdgeInsets.only(
                        top: wallPadding,
                        bottom: wallPadding,
                        left: wallPadding),
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LText(text: 'Just for you'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: wallPadding),
                              child: SText(text: 'view all'),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: wallPadding,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  var product = snapshot.data!;
                                  var provider =
                                      Provider.of<ProductDetailsProvider>(
                                    context,
                                    listen: false,
                                  );
                                  return GestureDetector(
                                    onTap: () =>
                                      
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  ProductDetails(image: product[i].images, price: product[i].price.toString(), title: product[i].title!,description: product[i].description!)))
                                    ,
                                    child: justForYouItems(
                                        i,
                                        product[i].images,
                                        product[i].title!,
                                        product[i].price.toString()),
                                  );
                                }))
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget categoriesItem(int i, image, String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: i.isEven ? secondColor : thirdColor,
          borderRadius: BorderRadius.circular(5),
        ),
        width: MediaQuery.of(context).size.width / 3,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(image[i]), fit: BoxFit.cover)),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SText(
                    text: name,
                    backgroundColor: black.withOpacity(0.5),
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget justForYouItems(
      int i, image, String productName, String productPrice) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: secondColor, borderRadius: BorderRadius.circular(5)),
              width: MediaQuery.of(context).size.width / 1.5,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(image[0]),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.favorite_outline),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          //item identity and price
          LText(text: productName),
          SText(text: 'GHC $productPrice'),
        ],
      ),
    );
  }
}
