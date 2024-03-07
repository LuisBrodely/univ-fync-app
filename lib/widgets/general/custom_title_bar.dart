import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/extra_small_text.dart';

class CustomTitleBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final FontWeight fontWeight;

  const CustomTitleBar({
    Key? key,
    required this.title,
    required this.subtitle,
    this.fontWeight = FontWeight.w900,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: 18,
            color: const Color(0xFF282828),
          ),
        ),
        ExtraSmallText(text: subtitle, fontWeight: FontWeight.w500),
      ],
    );
  }
}
