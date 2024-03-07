import 'package:flutter/material.dart';

class ExtraSmallText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const ExtraSmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF5C5C5C),
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
