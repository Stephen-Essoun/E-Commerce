import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/widgets/small_text.dart';

Widget categoriesItem(BuildContext context, int i, image, String name) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      decoration: BoxDecoration(
        color: i.isEven ? secondColor : thirdColor,
        borderRadius: BorderRadius.circular(5),
      ),
      width: MediaQuery.of(context).size.width / 2.8,
      child: Stack(
        children: [
          image != null
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(image),
                        fit: BoxFit.cover,
                      )),
                )
              : const Center(child: Text('No image')),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SText(
                  text: name,
                  overflow: TextOverflow.clip,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    ),
  );
}
