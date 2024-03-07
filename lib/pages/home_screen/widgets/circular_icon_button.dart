import 'package:flutter/material.dart';
import 'package:fync_app/pages/expenses_screen/expenses_screen.dart';
import 'package:fync_app/pages/income_screen/income_screen.dart';
import 'package:fync_app/pages/investments_screen/investments_screen.dart';
import 'package:fync_app/pages/savings_screen/savings_screen.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: backgroundColor,
            minimumSize: const Size(70, 70),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class FourCircularButtons extends StatelessWidget {
  const FourCircularButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularIconButton(
                icon: Icons.shopping_bag_outlined,
                text: 'Gastos',
                iconColor: Colors.black,
                backgroundColor: const Color(0xFFFF9393),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExpensesScreen()),
                  );
                },
              ),
              CircularIconButton(
                icon: Icons.savings_outlined,
                text: 'Ahorro',
                iconColor: Colors.white,
                backgroundColor: const Color(0xFF161515),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavingsScreen()),
                  );
                },
              ),
              CircularIconButton(
                icon: Icons.attach_money,
                text: 'Ingresos',
                iconColor: Colors.black,
                backgroundColor: const Color(0xFFDCEF64),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IncomeScreen()),
                  );
                },
              ),
              CircularIconButton(
                icon: Icons.add_chart,
                text: 'Inversiones',
                iconColor: Colors.white,
                backgroundColor: const Color(0xFF161515),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InvestmentsScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
