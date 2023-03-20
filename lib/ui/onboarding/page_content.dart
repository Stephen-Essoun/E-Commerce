import 'package:e_commerce/utils/constant/const.dart';
import 'package:e_commerce/utils/widgets/big_text.dart';
import 'package:e_commerce/utils/widgets/small_text.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const PageContent(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.contain),),
            ),
            wSpacing,
            LText(
              text: title,
              textAlign: TextAlign.center,
            ),
            wSpacing,
            SText(
              text: subTitle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
