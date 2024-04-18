import 'package:flutter/material.dart';
import 'package:fync_app/pages/home_screen/home_screen.dart';
import 'package:fync_app/pages/register_screen/register_screen.dart';
import 'package:fync_app/widgets/general/custom_button.dart';
import 'package:fync_app/widgets/general/custom_text_button.dart';
import 'package:fync_app/widgets/general/custom_text_field.dart';
import 'package:fync_app/widgets/general/small_text.dart';
import 'package:fync_app/widgets/general/social_button.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fync_app/services/auth_service.dart'; // Importar el AuthService
import 'package:fync_app/services/bank_service.dart'; // Importar el BankService

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    AuthService authService = AuthService();
    BankService bankService = BankService(); // Agregar el servicio bancario

    void login() async {
      try {
        final loginData = await authService.login(
          emailController.text,
          passwordController.text,
        );

        final userEmail = loginData['email'];
        final userName = loginData['name'];

        // Verificar si userEmail y userName no son nulos antes de pasarlos al método createBankAccount
        if (userEmail != null && userName != null) {
          // Crear la cuenta bancaria usando la información del usuario
          await bankService.createBankAccount(userEmail, userName);
        } else {
          throw Exception('Error: El email o el nombre del usuario es nulo');
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } catch (e) {
        print('Error al iniciar sesión: $e');
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF161515),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
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
                CustomTextField(
                  hintText: 'Correo electrónico',
                  borderColor: const Color(0xFF757575),
                  controller: emailController,
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  hintText: 'Contraseña',
                  borderColor: const Color(0xFF757575),
                  controller: passwordController,
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
                  onPressed: login, // Llamar al método de inicio de sesión
                ),
                const SizedBox(height: 28),
                CustomTextButton(
                  text: 'Crear una cuenta nueva',
                  textColor: const Color(0xFFFAFAFA),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
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
                      SocialButton(
                          onPressed: () {}, iconData: Ionicons.logo_apple),
                      const SizedBox(width: 20),
                      SocialButton(
                          onPressed: () {}, iconData: Ionicons.logo_google),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
