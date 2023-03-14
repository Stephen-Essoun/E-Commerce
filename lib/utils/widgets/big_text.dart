import 'package:flutter/cupertino.dart';

class LText extends StatelessWidget {
  final String text;
  final Color? color;
  double? fontSize;
  TextOverflow? overflow;
  LText({
    super.key,
    required this.text,
    this.color = const Color(0xff1f2223),
    this.fontSize = 22,
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
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
