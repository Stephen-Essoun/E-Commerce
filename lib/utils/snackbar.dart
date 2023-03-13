import 'package:flutter/material.dart';

snackBar (String content){return  SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.only(bottom: 600.0),
  dismissDirection: DismissDirection.horizontal,
  backgroundColor: Colors.lightGreen,
  content: Text(content),
);
}