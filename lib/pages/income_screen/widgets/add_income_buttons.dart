import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/custom_button.dart';

class AddIncomeButtons extends StatelessWidget {
  final VoidCallback onAddExpensePressed;
  final VoidCallback onCreateFixedExpensePressed;
  final VoidCallback onCreateCategoryPressed;

  const AddIncomeButtons({
    Key? key,
    required this.onAddExpensePressed,
    required this.onCreateFixedExpensePressed,
    required this.onCreateCategoryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          text: 'Añadir otro ingreso',
          backgroundColor: const Color(0xFFDCEF64),
          borderColor: const Color(0xFFDCEF64),
          textColor: const Color(0xFF282828),
          onPressed: onAddExpensePressed,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
