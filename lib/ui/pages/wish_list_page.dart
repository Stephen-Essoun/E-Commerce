import 'package:e_commerce/provider/add_to_wishlist.dart';
import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/appbar.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/medium_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/colors.dart';
import '../../utils/widgets/wish_list_tile.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  List items = [1, 1, 1, 1, 1, 1, 1];
  bool isExpanded = false;
  WishListProvider? getProduct;

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
          child: const CircleAvatar(
            backgroundColor: secondColor,
            foregroundColor: mainColor,
            child: Icon(Icons.person),
          ),
        ),
      ),
      body: context.watch<WishListProvider>().wishList.isEmpty
          ? Center(child: MText(text: 'No favorited products to show'))
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: wallPadding, vertical: wallPadding),
                  child: wishListTile(context),
                ),
              ],
            ),
    );
  }

  Widget wishListTile(BuildContext context) {
    var getProduct = context.watch<WishListProvider>();

    return Container(
        constraints: BoxConstraints(
          maxHeight: isExpanded
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * 0.65,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: secondColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
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
              child: ListView.builder(
                itemCount: getProduct.wishList.length,
                itemBuilder: (context, i) {
                  return WishListTile(
                      product: getProduct.wishList[i], i: i, context: context);
                },
              ),
            ),
            const Divider(
              height: 0,
              color: secondColor,
            ),
            ListTile(
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
                text: isExpanded ? 'Show less' : 'Show more',
                fontSize: 15,
              )),
            ),
          ],
        ));
  }
}
