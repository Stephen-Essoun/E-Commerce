import 'package:e_commerce/controllers/api.dart';
import 'package:e_commerce/controllers/network.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:e_commerce/widgets/big_text.dart';
import 'package:e_commerce/widgets/medium_text.dart';
import 'package:e_commerce/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    shopItem = shop.getItems();
    super.initState();
  }

  Future<Shop>? shopItem;
  Network shop = Network();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Shop>(
        future: shopItem,
        builder: (context, AsyncSnapshot<Shop> snapshot) {
          // var shopCategories = snapshot.data!.;
          if (
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitChasingDots(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var shopCategories = snapshot.data!.category;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 8.0, top: 16.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LText(text: 'Hello Stephen!'),
                          SText(
                              text: 'We have some options for you to consider.')
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: secondColor,
                          child: Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
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
                      padding: EdgeInsets.only(right: 16),
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
                      top: 16.0, bottom: 16.0, left: 16.0),
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LText(text: 'Categories'),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: SText(text: 'view all'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: ListView.builder(
                        // itemCount: ,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) => categoriesItem(
                            i, NetworkImage(shopCategories!.image![i])),
                      ))
                    ],
                  ),
                ),
                //just_for_you section
                Container(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 16.0),
                  height: MediaQuery.of(context).size.height / 2.1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LText(text: 'Just for you'),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: SText(text: 'view all'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: 11,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, i) => justForYouItems(i),
                      ))
                    ],
                  ),
                ),
              ],
            );
          }
          return SpinKitChasingDots();
        },
      ),
    );
  }

  Widget categoriesItem(int i, image) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
            color: i.isEven ? secondColor : thirdColor,
            borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width / 3,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image))),
                child: Center(
                  child: LText(
                    text: 'HeLLo',
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SText(text: 'HeLLo'),
                ))
          ],
        ),
      ),
    );
  }

  Widget justForYouItems(int i) {
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
                      child: Center(
                        child: LText(
                          text: 'HeLLo',
                        ),
                      ),
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
          LText(text: 'text'),
          SText(text: 'text'),
        ],
      ),
    );
  }
}
