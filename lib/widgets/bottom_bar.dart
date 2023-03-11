import 'package:e_commerce/utils/constant/const.dart';
import 'package:flutter/material.dart';

Widget bottomBar(context, leading,Widget button) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: wallPadding,
      vertical: 5,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: MediaQuery.of(context).size.width / 3,
          child: leading,
        ),
        Expanded(
          child: button,
        )
      ],
    ),
  );
}
