import 'package:e_commerce/ui/user_profile.dart';
import 'package:e_commerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget myTile({leading, trailing}) {
  return AppBar(
    foregroundColor: black,
    backgroundColor: white,
    elevation: 0,
    title: leading,
    actions: [Padding(padding: const EdgeInsets.all(9.0), child: trailing)],
  );
}
