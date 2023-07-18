import 'package:flutter/cupertino.dart';

class LText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
 final double? fontSize;
  final TextOverflow? overflow;
  const LText({
    super.key,
    required this.text,
    this.color = const Color(0xff1f2223),
    this.fontSize = 22,
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
        
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
