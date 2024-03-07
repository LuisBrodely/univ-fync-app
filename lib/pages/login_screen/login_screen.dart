import 'package:flutter/material.dart';
import 'package:fync_app/pages/home_screen/home_screen.dart';
import 'package:fync_app/widgets/general/custom_button.dart';
import 'package:fync_app/widgets/general/custom_text_field.dart';
import 'package:fync_app/widgets/general/small_text.dart';
import 'package:fync_app/widgets/general/social_button.dart';
import 'package:ionicons/ionicons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161515),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Ionicons.medical,
                    size: 46, color: Color(0xFFDCEF64)),
                const SizedBox(height: 18),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFF9F9F9),
                  ),
                ),
                const SizedBox(height: 10),
                const SmallText(
                  text: 'Ingresa tus datos para comenzar',
                ),
                const SizedBox(height: 32),
                const CustomTextField(
                  hintText: 'Correo electrónico',
                  borderColor: Color(0xFF757575),
                ),
                const SizedBox(height: 24),
                const CustomTextField(
                  hintText: 'Contraseña',
                  borderColor: Color(0xFF757575),
                ),
                const SizedBox(height: 26),
                const Align(
                  alignment: Alignment.centerRight,
                  child: SmallText(
                    text: '¿Olvidaste tu contraseña?',
                    color: Color(0xFFDCEF64),
                  ),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Iniciar Sesión',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
                const SizedBox(height: 28),
                const SmallText(
                  text: 'Crear una cuenta nueva',
                  color: Color(0xFFFAFAFA),
                ),
                const SizedBox(height: 54),
                const SmallText(
                  text: 'También puedes ingresar con',
                  color: Color(0xFFDCEF64),
                ),
                const SizedBox(height: 28),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(onPressed: () {}, iconData: Ionicons.logo_apple),
                      const SizedBox(width: 20),
                      SocialButton(onPressed: () {}, iconData: Ionicons.logo_google),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
