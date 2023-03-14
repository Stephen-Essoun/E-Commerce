import 'package:flutter/material.dart';

snackBar(String content) {
  return SnackBar(
    elevation: 0,
    duration: const Duration(milliseconds: 600),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 600.0),
    dismissDirection: DismissDirection.none,
    backgroundColor: Colors.green,
    content: Text(content),
  );
}
