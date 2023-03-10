import 'package:e_commerce/utils/constant/colors.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(leading, trailing) {
  return AppBar(
    backgroundColor: scaffold,
    elevation: 0,
    title: leading,
    actions: [Padding(padding: const EdgeInsets.all(9.0), child: trailing)],
  );
}
