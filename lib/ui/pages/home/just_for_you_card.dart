// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/wish_list.dart';
import '../../../provider/add_to_wishlist.dart';
import '../../../provider/auth.dart';
import '../../../utils/alert_dialog.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/constant/const.dart';
import '../../../utils/constant/route.dart';
import '../../../utils/widgets/big_text.dart';
import '../../../utils/widgets/small_text.dart';
import '../../product_details.dart';

// bool isLiked = false;

class JustForYouCard extends StatefulWidget {
  final dynamic image;
  final String productName;
  final int productPrice;
  final String description;
  final int index;
  const JustForYouCard(
      {super.key,
      required this.image,
      required this.productName,
      required this.productPrice,
      required this.description,
      required this.index});

  @override
  State<JustForYouCard> createState() => _JustForYouCardState();
}

class _JustForYouCardState extends State<JustForYouCard> {
  bool isLiked = false;
  var user;
  WishList? wishList;
  @override
  void initState() {
    super.initState();
  }

  @override
  didChangeDependencies() {
    user = context.watch<Authentication>().user;
    wishList = WishList(
      id: widget.index,
      image: widget.image,
      price: widget.productPrice,
      description: widget.description,
      title: widget.productName,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.read<WishListProvider>();

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
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductDetails(
                          image: widget.image,
                          price: widget.productPrice,
                          title: widget.productName,
                          description: widget.description))),
                  onDoubleTap: () {},
                  child: Center(
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(widget.image[0]),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(wallPadding),
                            child: InkWell(
                              onTap: () {
                                if (user != null) {
                                  //if user's account isn't verified
                                  if (!user.emailVerified) {
                                    alertDialog(
                                        context: context,
                                        title: 'Authentication',
                                        content:
                                            "User's account is\nnot verified",
                                        onPressed: () =>
                                            Navigator.pushReplacementNamed(
                                                context, emailVerifyRoute));
                                  }
                                  //if user's account is verified
                                  else if (user.emailVerified) {
                                    setState(() {
                                      isLiked = !isLiked;
                                    });
                                    Provider.of<WishListProvider>(context,
                                            listen: false)
                                        .addToWishList(wishList!, widget.index);
                                  }
                                }
                                //if not account is available on the device
                                else {
                                  alertDialog(
                                    context: context,
                                    title: 'Authentication',
                                    content:
                                        "Continue to create account or sign in",
                                    onPressed: () =>
                                        Navigator.pushReplacementNamed(
                                      context,
                                      toggleBetweenUIRoute,
                                    ),
                                  );
                                }
                              },
                              child: Icon(
                                provider.isFavorited
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline_outlined,
                                color: mainColor,
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
              text: widget.productName,
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
            ),
            SText(
              text: 'GHC ${widget.productPrice}',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
