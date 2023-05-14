import 'package:e_commerce/controllers/network.dart';
import 'package:e_commerce/provider/auth.dart';
import 'package:e_commerce/provider/cart.manager.dart';
import 'package:e_commerce/ui/pages/main_page.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/constant/route.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../utils/appbar_profile_avatar.dart.dart';
import 'category_card.dart';
import 'just_for_you_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Authentication auth = Authentication();
  @override
  void initState() {
    auth.context = context;
    fetchProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
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
                    trailing: const UserAppBarProfile(),
                  ),
                  body: ListView(
                    physics: const NeverScrollableScrollPhysics(),
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
                                  child: GestureDetector(
                                      child: SText(text: 'view all')),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: wallPadding,
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, i) {
                                      var category = snapshot.data![i].category;
                                      return categoriesItem(
                                          context,
                                          i,
                                          'http://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
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
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushNamed(justForYouRoute),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: wallPadding),
                                    child: SText(text: 'view all'),
                                  ),
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
                                  return JustForYouCard(
                                      key: widget.key,
                                      image: product[i].image,
                                      productName: product[i].title,
                                      productPrice: product[i].price.toInt(),
                                      description: product[i].description,
                                      index: i);
                                },
                              ),
                            )
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
                            onPressed: () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                                (route) => false),
                            child: const Text('Refresh'),
                          ),
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
}
