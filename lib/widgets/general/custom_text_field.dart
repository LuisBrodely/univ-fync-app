import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final double width;
  final double height;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged; // Nuevo parámetro onChanged

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.borderColor = const Color(0xFF757575),
    this.width = double.infinity,
    this.height = 50,
    this.controller,
    this.onChanged, // Agregar onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged, // Asignar onChanged al TextField
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFFA4A4A4),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
        ),
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFFA4A4A4),
        ),
      ),
    );
  }
}
