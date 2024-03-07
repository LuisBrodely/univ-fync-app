import 'package:flutter/material.dart';

class CustomSmallInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconBackgroundColor;

  const CustomSmallInfoCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.iconBackgroundColor = const Color(0xFFDCEF64),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFAFAFA),
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFFD9D9D9),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
