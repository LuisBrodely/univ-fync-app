import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/small_text.dart';

class CustomSubtractionBox extends StatelessWidget {
  final String totalExpense;

  const CustomSubtractionBox({Key? key, required this.totalExpense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF161515),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            decoration: const BoxDecoration(
              color: Color(0xFFFF9393),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SmallText(
                    text: 'Suma total de gastos hoy', color: Color(0xFFFF9393)),
                const SizedBox(height: 6),
                Text(
                  '\$$totalExpense',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
