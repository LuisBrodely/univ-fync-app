import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xFFBEBEBE),
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
