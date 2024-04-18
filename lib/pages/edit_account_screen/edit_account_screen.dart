import 'package:flutter/material.dart';
import 'package:fync_app/services/auth_service.dart';
import 'package:fync_app/services/bank_service.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_button.dart';
import 'package:fync_app/widgets/general/custom_text_field.dart';
import 'package:fync_app/widgets/general/small_text.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController newNip = TextEditingController();
    final AuthService _authService = AuthService(); // Instancia de AuthService

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBarButtons(
            leftButtonColor: Colors.white, rightButtonColor: Colors.white),
      ),
      backgroundColor: const Color(0xFF161515),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                const Text(
                  'Editar Cuenta',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFF9F9F9),
                  ),
                ),
                const SizedBox(height: 10),
                const SmallText(
                  text: 'Ingresa el nuevo NIP',
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  hintText: 'NIP',
                  borderColor: const Color(0xFF757575),
                  controller: newNip,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Guardar',
                  onPressed: () async {
                    try {
                      final userId =
                          await _authService.getUserId(); // Obtener el user_id
                      await BankService()
                          .editBankAccount(userId ?? '', newNip.text);
                      Navigator.pop(context,
                          true); // Devuelve true para indicar que se guardó la cuenta
                    } catch (e) {
                      print('Error al editar la cuenta bancaria: $e');
                    }
                  },
                ),
                const SizedBox(height: 28)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
