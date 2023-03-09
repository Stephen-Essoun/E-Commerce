import 'package:flutter/cupertino.dart';

class SText extends StatelessWidget {
  final String text;
  final Color? color;
  double? fontSize;
  TextOverflow? overflow;
  SText({
    super.key,
    required this.text,
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
        color: color,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
