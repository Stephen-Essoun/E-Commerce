// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/wish_list.dart';
import '../../../provider/auth.dart';
import '../../../provider/wishlist.dart';
import '../../../utils/alert_dialog.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/constant/route.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key, required this.id, required this.wishList});
  final int id;
  final WishList wishList;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //to toglle btn favorited and unfavorited icon
      context.read<WishListProvider>().favPro(widget.id.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toggleFavoriteState(),
      child: Icon(
        Provider.of<WishListProvider>(context).isFavorited
            ? Icons.favorite_rounded
            : Icons.favorite_outline_outlined,
        color: mainColor,
      ),
    );
  }

  toggleFavoriteState() async {
    final user = context.read<Authentication>().user;
    if (user != null) {
      //if user's account isn't verified
      if (!user.emailVerified) {
        alertDialog(
          context: context,
          title: 'Authentication',
          content: "User's account is\nnot verified",
          onPressed: () =>
              Navigator.pushReplacementNamed(context, emailVerifyRoute),
        );
      }
      Provider.of<WishListProvider>(context, listen: false)
          .addProduct(widget.wishList, widget.id.toString());
      //to immidiately toggle btn favorited and unfavorited icon
      await context.read<WishListProvider>().favPro(widget.id.toString());
    }
    //if no account is available on the device
    else {
      alertDialog(
        context: context,
        title: 'Authentication',
        content: "Continue to create account or sign in",
        onPressed: () => Navigator.pushReplacementNamed(
          context,
          toggleBetweenUIRoute,
        ),
      );
    }
  }
}
