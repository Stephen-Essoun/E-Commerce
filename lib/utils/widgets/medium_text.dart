import 'package:flutter/cupertino.dart';

class MText extends StatelessWidget {
  final String text;
  final Color? color;
 final double? fontSize;
  final TextOverflow? overflow;
  const MText({
    super.key,
    required this.text,
    this.color = const Color(0xff1f2223),
    this.fontSize = 15,
    this.overflow = TextOverflow.ellipsis,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
