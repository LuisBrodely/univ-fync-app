import 'package:flutter/material.dart';
import 'package:fync_app/pages/login_screen/login_screen.dart';
import 'package:fync_app/widgets/general/custom_button.dart';
import 'package:fync_app/widgets/general/custom_text_button.dart';
import 'package:fync_app/widgets/general/custom_text_field.dart';
import 'package:fync_app/widgets/general/small_text.dart';
import 'package:fync_app/widgets/general/social_button.dart';
import 'package:ionicons/ionicons.dart';
import 'package:fync_app/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService(); // Instancia del AuthService

    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

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
                  'Registrarme',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFF9F9F9),
                  ),
                ),
                const SizedBox(height: 10),
                const SmallText(
                  text: 'Ingresa tus datos para continuar',
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  hintText: 'Usuario',
                  borderColor: const Color(0xFF757575),
                  controller: usernameController,
                ),
                const SizedBox(height: 24),
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
                const SizedBox(height: 24),
                CustomTextField(
                  hintText: 'Confirmar Contraseña',
                  borderColor: const Color(0xFF757575),
                  controller: confirmPasswordController,
                ),
                const SizedBox(height: 26),
                CustomButton(
                  text: 'Registrarme',
                  onPressed: () async {
                    try {
                      String username = usernameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      String confirmPassword = confirmPasswordController.text;

                      if (password == confirmPassword) {
                        final token = await authService.register(
                            username, email, password);
                        print('Usuario registrado exitosamente. Token: $token');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content:
                                const Text('Las contraseñas no coinciden.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cerrar'),
                              ),
                            ],
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                const SizedBox(height: 28),
                CustomTextButton(
                  text: 'Iniciar sesión',
                  textColor: const Color(0xFFFAFAFA),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
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
                        onPressed: () {},
                        iconData: Ionicons.logo_apple,
                      ),
                      const SizedBox(width: 20),
                      SocialButton(
                        onPressed: () {},
                        iconData: Ionicons.logo_google,
                      ),
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
