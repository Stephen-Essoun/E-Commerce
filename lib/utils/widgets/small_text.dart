import 'package:flutter/cupertino.dart';

class SText extends StatelessWidget {
  final String text;
  final Color? color;
 final double? fontSize;
 final TextOverflow? overflow;
 final Color? backgroundColor;
  final TextAlign? textAlign;
  const SText({
    super.key,
    required this.text,
    this.backgroundColor,
    this.color = const Color(0xff8e9090),
    this.fontSize = 12,
    this.overflow = TextOverflow.ellipsis, this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textAlign ,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        color: color,backgroundColor: backgroundColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
