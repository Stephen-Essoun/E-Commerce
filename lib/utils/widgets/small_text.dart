import 'package:e_commerce/utils/constant/colors.dart';
import 'package:flutter/cupertino.dart';

class SText extends StatelessWidget {
  final String text;
  final Color? color;
  double? fontSize;
  TextOverflow? overflow;
  Color? backgroundColor;
  SText({
    super.key,
    required this.text,
    this.backgroundColor,
    this.color = const Color(0xff8e9090),
    this.fontSize = 12,
    this.overflow = TextOverflow.ellipsis,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        color: color,backgroundColor: backgroundColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
