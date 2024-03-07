import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/extra_small_text.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF282828),
              ),
            ),
            ExtraSmallText(text: subtitle),
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ],
    );
  }
}
