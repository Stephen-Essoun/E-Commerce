// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth.dart';
import '../../../provider/wishlist.dart';
import '../../../utils/alert_dialog.dart';
import '../../../utils/constant/route.dart';

setFavorite (BuildContext context,id,isLiked,product) {
  final  user = context.read<Authentication>().user;
                    if (user != null) {
                      //if user's account isn't verified
                      if (!user.emailVerified) {
                        alertDialog(
                            context: context,
                            title: 'Authentication',
                            content: "User's account is\nnot verified",
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, emailVerifyRoute));
                      }
                      //if user's account is verified
                      else if (user.emailVerified) {
                        isLiked
                            ? Provider.of<WishListProvider>(context,
                                    listen: false)
                                .deleteWhere('')
                            : Provider.of<WishListProvider>(context,
                                    listen: false)
                                .addProduct(product,'');
                      }
                    }
                    //if not account is available on the device
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