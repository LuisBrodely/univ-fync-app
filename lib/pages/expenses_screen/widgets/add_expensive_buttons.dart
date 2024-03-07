import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/custom_button.dart';

class AddExpenseButtons extends StatelessWidget {
  final VoidCallback onAddExpensePressed;
  final VoidCallback onCreateFixedExpensePressed;
  final VoidCallback onCreateCategoryPressed;

  const AddExpenseButtons({
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
          text: 'Añadir otro gasto',
          backgroundColor: const Color(0xFFFF9393),
          borderColor: const Color(0xFFFF9393),
          textColor: const Color(0xFFFAFAFA),
          onPressed: onAddExpensePressed,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Crear gasto fijo',
                backgroundColor: const Color(0xFFFAFAFA),
                textColor: const Color(0xFF282828),
                borderColor: const Color(0xFFB6B6B6),
                onPressed: onCreateFixedExpensePressed,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CustomButton(
                text: 'Crear categoría',
                backgroundColor: const Color(0xFF1E1C1C),
                borderColor: const Color(0xFF1E1C1C),
                textColor: const Color(0xFFFAFAFA),
                onPressed: onCreateCategoryPressed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
