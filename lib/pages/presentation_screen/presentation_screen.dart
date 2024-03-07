import 'package:flutter/material.dart';
import 'package:fync_app/pages/register_screen/register_screen.dart';
import 'package:fync_app/widgets/general/custom_button.dart';
import 'package:fync_app/widgets/general/small_text.dart';
import 'package:fync_app/widgets/general/social_button.dart';
import 'package:ionicons/ionicons.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF161515),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Ionicons.medical, size: 20, color: Color(0xFFDCEF64)),
                    SizedBox(width: 12),
                    Text('Fync',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFFFAFAFA))),
                  ],
                ),
                const SizedBox(height: 78),
                const SizedBox(
                  width: 240,
                  child: Text(
                    'Optimiza Gastos, Ahorra Mientras Disfrutas.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 46,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFAFAFA),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const SizedBox(
                  width: 325,
                  child: SmallText(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget interdum bibendum sapien, vitae tristique morbi ipsum eget tortor.',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Container(
                      width: 69,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD2D2D2),
                        border: Border.all(color: const Color(0xFFD2D2D2)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 27,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF343434),
                        border: Border.all(color: const Color(0xFF343434)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 27,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF343434),
                        border: Border.all(color: const Color(0xFF343434)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 88),
                Row(
                  children: [
                    CustomButton(
                      text: 'Regístrate',
                      width: 156,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                        onPressed: () {}, iconData: Ionicons.logo_apple),
                    const SizedBox(width: 20),
                    SocialButton(
                        onPressed: () {}, iconData: Ionicons.logo_google),
                  ],
                ),
                const SizedBox(height: 40),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(
                        text: '¿Ya tienes una cuenta?',
                        color: Color(0xFFD2D2D2),
                      ),
                      SizedBox(width: 8),
                      SmallText(
                        text: 'Iniciar Sesión',
                        color: Color(0xFFDCEF64),
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
