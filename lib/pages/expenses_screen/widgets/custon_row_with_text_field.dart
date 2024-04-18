import 'package:flutter/material.dart';
import 'package:fync_app/widgets/general/custom_text_field.dart';
import 'package:fync_app/widgets/general/custom_square_icon_button.dart';

class CustomRowWithTextField extends StatelessWidget {
  final String nameHintText;
  final String amountHintText;
  final Color backgroundBox;
  final Color iconColor;
  final VoidCallback onRemovePressed;

  const CustomRowWithTextField({
    Key? key,
    required this.nameHintText,
    required this.amountHintText,
    required this.onRemovePressed,
    this.backgroundBox = const Color(0xFFFF9393),
    this.iconColor = const Color(0xFFFFFFFF),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            hintText: '$nameHintText - $amountHintText',
            borderColor: const Color(0xFF5E5E5E),
          ),
        ),
        const SizedBox(width: 10),
        CustomSquareIconButton(
          icon: Icons.edit_outlined,
          backgroundColor: backgroundBox,
          onPressed: onRemovePressed,
          iconColor: iconColor,
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
