import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/custom_text_field.dart';
import 'package:fync_app/widgets/general/custom_square_icon_button.dart';

class CustomRowWithTextField extends StatelessWidget {
  final String nameHintText;
  final String amountHintText;
  final VoidCallback onRemovePressed;

  const CustomRowWithTextField({
    Key? key,
    required this.nameHintText,
    required this.amountHintText,
    required this.onRemovePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextField(
          hintText: nameHintText,
          width: 180,
          borderColor: const Color(0xFFB6B6B6),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomTextField(
            hintText: amountHintText,
            borderColor: const Color(0xFFB6B6B6),
          ),
        ),
        const SizedBox(width: 10),
        CustomSquareIconButton(
          icon: Icons.delete_outline,
          onPressed: onRemovePressed,
        ),
      ],
    );
  }
}
