// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/widgets/big_text.dart';
import '../../../utils/widgets/small_text.dart';
import '../../product_details.dart';

// bool isLiked = false;

class JustForYouCard extends StatefulWidget {
  final dynamic image;
  final String productName;
  final int productPrice;
  final String description;
  final int index;

  const JustForYouCard(
      {super.key,
      required this.image,
      required this.productName,
      required this.productPrice,
      required this.description,
      required this.index});

  @override
  State<JustForYouCard> createState() => _JustForYouCardState();
}

class _JustForYouCardState extends State<JustForYouCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: secondColor, borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width / 1.5,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductDetails(
                          id: widget.index,
                          title: widget.productName,
                          image: widget.image,
                          price: widget.productPrice,
                          description: widget.description))),
                  onDoubleTap: () {},
                  child: Center(
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Center(
                          child:widget.image.isNotEmpty? CachedNetworkImage(
                            imageUrl: widget.image,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.colorBurn,
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ):const Center(child:Text('No image')),
                         
                        ),
                      ],
                    ),
                  ),
               
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //item identity and price
            LText(
              text: widget.productName,
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
            ),
            SText(
              text: 'GHC ${widget.productPrice}',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
