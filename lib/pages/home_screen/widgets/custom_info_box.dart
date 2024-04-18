import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/small_text.dart';

class CustomInfoBox extends StatelessWidget {
  final String totalAmount;
  final String totalExpense;
  final String totalIncome;

  const CustomInfoBox(
      {Key? key,
      this.totalAmount = '333',
      required this.totalExpense,
      required this.totalIncome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF161515),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xFFDCEF64),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const SmallText(text: 'Saldo Disponible', color: Color(0xFFDCEF64)),
          const SizedBox(height: 6),
          Text(
            '\$$totalAmount',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _InfoColumn(
                title: 'Ingresos',
                amount: '\$$totalIncome',
              ),
              _InfoColumn(
                title: 'Gastos',
                amount: '\$$totalExpense',
              ),
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String title;
  final String amount;

  const _InfoColumn({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFDCEF64),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
