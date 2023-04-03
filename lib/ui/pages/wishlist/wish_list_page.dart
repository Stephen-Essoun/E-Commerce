import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/provider/wishlist.dart';
import 'package:e_commerce/ui/product_details.dart';
import 'package:e_commerce/utils/appbar_profile_avatar.dart.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/constant/progress_inducator.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/wish_list.dart';
import '../../../utils/constant/colors.dart';
import 'wish_list_tile.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  bool isExpanded = false;
  late Stream<QuerySnapshot<WishList>> wishlist;
  // @override
  // void initState() {
  //   wishlist = WishListProvider().getProducts();
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    wishlist = Provider.of<WishListProvider>(context).getProducts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: myTile(
        leading: LText(text: 'WishList'),
        trailing: GestureDetector(
            onTap: () {
              debugPrint('response.body.toString()');
            },
            child: const UserAppBarProfile()),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: wallPadding, vertical: wallPadding),
            child: wishListTile(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: wallPadding),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: white,
                  foregroundColor: mainColor,
                  side: const BorderSide(
                      width: 2, // the thickness
                      color: mainColor // the color of the border
                      )),
              child: const Text('+ create a wishlist'),
            ),
          )
        ],
      ),
    );
  }

  Widget wishListTile(BuildContext context) {
    var getProduct = context.watch<WishListProvider>();
    var containerSmallHeight = MediaQuery.of(context).size.height * 0.56;
    var containerLargeHeight = MediaQuery.of(context).size.height / 1.3;
    return Container(
        constraints: BoxConstraints(
          maxHeight: isExpanded == false || getProduct.wishList.length < 4
              ? containerSmallHeight
              : containerLargeHeight,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: secondColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                dense: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                leading: MText(text: 'Must buy'),
                trailing: const Icon(
                  Icons.more_horiz,
                  color: grey,
                )),
            const Divider(
              height: 0,
              color: secondColor,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<WishList>>(
                  stream: wishlist,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (snapshot.hasError) {
                      log(snapshot.error.toString());
                    } else if (snapshot.hasData) {
                      final wishlist = data!.docs;
                      log('data available');

                      return ListView.builder(
                        itemCount: wishlist.length,
                        itemBuilder: (context, i) {
                          final document = wishlist[i].data();
                          return wishlist.isEmpty
                              ? Center(
                                  child: MText(
                                      text: 'No favorited products to show'))
                              : Center(
                                  child: WishListTile(
                                      product: document,
                                      id: wishlist[i].id,
                                      i:i,
                                      context: context),
                                );
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            Visibility(
              visible: getProduct.wishList.length < 4 ? false : true,
              child: const Divider(
                height: 0,
                color: secondColor,
              ),
            ),
            Visibility(
              visible: getProduct.wishList.length < 4 ? false : true,
              child: ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                title: Center(
                    child: SText(
                  text: isExpanded
                      ? 'Show less'
                      : 'Show ${getProduct.wishList.length - 3} more items',
                  fontSize: 15,
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
