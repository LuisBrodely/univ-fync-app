import 'package:flutter/material.dart';

class CustomTextInfoCard extends StatelessWidget {
  final String text; 
  final String title;
  final String subtitle;
  final String amount;
  final Color iconBackgroundColor;
  final Color iconColor;
  final bool isSaving;

  const CustomTextInfoCard({
    Key? key,
    required this.text, 
    required this.title,
    required this.subtitle,
    required this.amount,
    this.iconBackgroundColor = const Color(0xFF161515),
    this.iconColor = const Color(0xFFFAFAFA),
    this.isSaving = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text( 
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      color: iconColor,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5E5E5E),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '${isSaving ? '+' : ''}\$$amount',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
