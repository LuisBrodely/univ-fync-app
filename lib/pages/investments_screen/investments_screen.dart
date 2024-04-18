import 'package:flutter/material.dart';
import 'package:fync_app/pages/edit_account_screen/edit_account_screen.dart';
import 'package:fync_app/pages/investments_screen/widgets/custom_revenue_box.dart';
import 'package:fync_app/services/bank_service.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_button.dart';
import 'package:fync_app/services/auth_service.dart'; // Importa tu AuthService
import 'dart:convert';
import 'package:http/http.dart' as http;

class InvestmentsScreen extends StatefulWidget {
  const InvestmentsScreen({Key? key}) : super(key: key);

  @override
  _InvestmentsScreenState createState() => _InvestmentsScreenState();
}

class _InvestmentsScreenState extends State<InvestmentsScreen> {
  final AuthService _authService = AuthService(); // Instancia de AuthService
  String? accountName = ''; // Variable para almacenar el nombre del usuario
  String? accountNumber = ''; // Variable para almacenar el nombre del usuario
  String? accountNip = ''; // Variable para almacenar el nombre del usuari

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  // Método para obtener los detalles del usuario, incluido el nombre
  void _getUserDetails() async {
    try {
      final userId = await _authService.getUserId(); // Obtener el user_id
      // Hacer la solicitud a '/api/bank_accounts/list/{user_id}'
      final response = await http.get(
        Uri.parse('http://3.22.52.255/api/bank_accounts/list/$userId'),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          accountName = responseData['name']; // Almacenar el nombre del usuario
          accountNumber =
              responseData['account_number']; // Almacenar el nombre del usuario
          accountNip = responseData['nip']; // Almacenar el nombre del usuario
        });
      } else {
        throw Exception('Error al obtener los detalles del usuario');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBarButtons(
          leftButtonColor: Colors.white,
          rightButtonColor: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF161515),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mi Cartera',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFFFAFAFA),
                ),
              ),
              const SizedBox(height: 42),
              const Text(
                'Cuenta',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFFFAFAFA),
                ),
              ),
              const SizedBox(height: 30),
              CustomRevenueBox(
                firstText: accountName ?? '',
                secondText: accountNip ?? '',
                thirdText: accountNumber ?? '',
                fourthText: '',
                boxColor: const Color(0xFF128E83),
                firstTextColor: const Color(0xFFA1E0DA),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Editar',
                backgroundColor: const Color(0xFFDCEF64),
                borderColor: const Color(0xFFDCEF64),
                textColor: const Color(0xFF282828),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditAccountScreen(),
                    ),
                  ).then((value) {
                    if (value == true) {
                      // Si se guardaron los cambios, actualiza los detalles de la cuenta
                      _getUserDetails();
                    }
                  });
                },
              ),
              const SizedBox(height: 36),
              CustomButton(
                text: 'Borrar',
                backgroundColor: const Color(0xFFFF9393),
                borderColor: const Color(0xFFFF9393),
                textColor: const Color(0xFFFFFFFF),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmar'),
                        content: const Text(
                            '¿Estás seguro de que deseas eliminar esta cuenta bancaria?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () async {
                              try {
                                // Llama al método para eliminar la cuenta bancaria
                                final userId = await _authService
                                    .getUserId(); // Obtener el user_id
                                await BankService()
                                    .deleteBankAccount(userId ?? '');
                                Navigator.pop(context); // Cierra el diálogo
                                // Actualiza la pantalla después de eliminar la cuenta
                                setState(() {
                                  accountName = null;
                                  accountNumber = null;
                                  accountNip = null;
                                });
                              } catch (e) {
                                print(
                                    'Error al eliminar la cuenta bancaria: $e');
                                // Muestra un mensaje de error en caso de fallo
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Error al eliminar la cuenta bancaria')),
                                );
                              }
                            },
                            child: const Text('Sí'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Cierra el diálogo
                            },
                            child: const Text('Cancelar'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
