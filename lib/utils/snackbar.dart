import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  final snackBar = SnackBar(
    elevation: 0,
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 600.0),
    dismissDirection: DismissDirection.none,
    backgroundColor: Colors.green,
    content: Text(content),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
