import 'package:flutter/material.dart';

class CustomSquareIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  const CustomSquareIconButton({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFF1E1C1C),
    this.iconColor = const Color(0xFFFAFAFA),
    this.size = 50,
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
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
            minimumSize: Size(size, size),
          ),
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              icon,
              size: 22,
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }
}
