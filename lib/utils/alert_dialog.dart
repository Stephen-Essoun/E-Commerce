
  import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:flutter/material.dart';

Future<dynamic> alertDialog({
    required BuildContext context,
    required String title,
    required String content,
    required void Function() onPressed,
  }) {
    return showDialog(
        context: context,
        builder: (ctx) => AspectRatio(
            aspectRatio: 16 / 9,
            child: AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              actionsPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              title: LText(text: title),
              content: Text(
                content,
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Later')),
                TextButton(onPressed: onPressed, child: const Text('Continue'))
              ],
            )));
  }