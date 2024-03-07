import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/extra_small_text.dart';
import 'package:fync_app/widgets/general/small_text.dart';

class CustomRevenueBox extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;
  final String fourthText;
  final Color boxColor;
  final Color firstTextColor;

  const CustomRevenueBox({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
    required this.fourthText,
    required this.boxColor,
    required this.firstTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1E1C1C),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallText(text: firstText, color: firstTextColor),
                    ExtraSmallText(text: secondText, color: const Color(0xFFF4F4F4)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      thirdText,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0xFFE7E7E7),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      fourthText,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Color(0xFFE7E7E7),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
