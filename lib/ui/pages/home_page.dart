import 'dart:developer';

import 'package:e_commerce/controllers/network.dart';
import 'package:e_commerce/model/wish_list.dart';
import 'package:e_commerce/provider/add_to_wishlist.dart';
import 'package:e_commerce/provider/handle_isfavorited.dart';
import 'package:e_commerce/ui/pages/main_page.dart';
import 'package:e_commerce/ui/product_details.dart';
import 'package:e_commerce/ui/user_profile.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void didChangeDependencies() {
    getProducts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: getProducts,
        color: Colors.white,
        backgroundColor: mainColor,
        child: FutureBuilder(
            future: getProducts(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                return Scaffold(
                  appBar: myTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LText(text: 'Hello Stephen!'),
                        SText(text: 'We have some options for you to consider.')
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserProfile())),
                      child: const CircleAvatar(
                        backgroundColor: secondColor,
                        foregroundColor: mainColor,
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  body: Column(
                    children: [
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
                        height: MediaQuery.of(context).size.height / 3.5,
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
                                      var category =
                                          snapshot.data![i].category!;
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
                        height: MediaQuery.of(context).size.height / 2.1,
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

                                      return GestureDetector(
                                        onTap: () => Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    ProductDetails(
                                                        image:
                                                            product[i].images,
                                                        price: product[i]
                                                            .price!
                                                            .toString(),
                                                        title:
                                                            product[i].title!,
                                                        description: product[i]
                                                            .description!))),
                                        child: justForYouItems(
                                            product[i].images,
                                            product[i].title!,
                                            product[i].description!,
                                            product[i].price.toString(),
                                            false,
                                            i),
                                      );
                                    }))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Scaffold(
                  body: RefreshIndicator(
                    onRefresh: getProducts,
                    child: Center(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Please check your internet connection\nand click or pull down to reload',
                          ),
                          TextButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const MainScreen())),
                              child: const Text('Refresh'))
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitWave(
                    size: 40,
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? mainColor : secondColor,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MText(
                    text: 'Loading...',
                    fontSize: 12,
                  )
                ],
              ));
            }));
  }

  Widget categoriesItem(int i, image, String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: i.isEven ? secondColor : thirdColor,
          borderRadius: BorderRadius.circular(5),
        ),
        width: MediaQuery.of(context).size.width / 2.8,
        child: Stack(
          children: [
            Center(
              child: Container(
                foregroundDecoration:
                    BoxDecoration(color: black.withOpacity(0.5)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SText(
                    text: name,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget justForYouItems(image, String productName, String productPrice,
      String description, bool isLiked, int index) {
    bool isLiked = false;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: secondColor, borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width / 1.5,
                child: InkWell(
                  onDoubleTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Center(
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
                        Padding(
                            padding: const EdgeInsets.all(wallPadding),
                            child: InkWell(
                              onTap: () => setState(() {
                                isLiked = !isLiked;
                                Provider.of<WishListProvider>(context,
                                        listen: false)
                                    .addToWishList(WishList(
                                        image: image,
                                        price: productPrice,
                                        description: description,
                                        title: productName,
                                        isFavorited: isLiked));
                              }),
                              child: Icon(
                                isLiked == true
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline_outlined,
                                color: favorited,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //item identity and price
            LText(
              text: productName,
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
            ),
            SText(
              text: 'GHC $productPrice',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
