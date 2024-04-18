import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/small_text.dart';

class CustomAdditionBox extends StatelessWidget {
  final String totalIncome;

  const CustomAdditionBox({Key? key, required this.totalIncome}) : super(key: key);

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
              color: Color(0xFFDCEF64),
              borderRadius: BorderRadius.only(
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
                const SmallText(
                    text: 'Suma total de ingresos hoy',
                    color: Color(0xFFDCEF64)),
                const SizedBox(height: 6),
                Text(
                  '+\$$totalIncome',
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
