import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const SocialButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF757575), width: 1),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          size: 24,
          color: const Color(0xFFFCFCFC),
        ),
      ),
    );
  }
}
