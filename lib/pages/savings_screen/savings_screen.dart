import 'package:flutter/material.dart';
import 'package:fync_app/pages/savings_screen/widgets/custom_circular_chart.dart';
import 'package:fync_app/pages/savings_screen/widgets/custom_small_info_card.dart';
import 'package:fync_app/services/auth_service.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_text_info_card.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';
import 'package:fync_app/services/bank_service.dart'; // Importa tu servicio BankService

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  _SavingsScreenState createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  List<Map<String, dynamic>> incomes = []; // Lista para almacenar los ingresos
  final AuthService _authService = AuthService(); // Instancia de AuthService


  @override
  void initState() {
    super.initState();
    _getIncomes(); // Obtener los ingresos al iniciar la pantalla
  }

  // Método para obtener los ingresos
  void _getIncomes() async {
    try {
      final userId =
                          await _authService.getUserId();
      // Llama al método para obtener los ingresos del servicio BankService
      final List<Map<String, dynamic>> incomesData =
          await BankService().getIncomes(userId ?? '');
      setState(() {
        incomes = incomesData; // Actualiza la lista de ingresos
      });
    } catch (e) {
      print('Error al obtener los ingresos: $e');
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
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Ahorro total',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFDCEF64),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                '\$56,672.00',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const SizedBox(height: 50),
              const CustomCircularChart(),
              const SizedBox(height: 44),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    CustomSmallInfoCard(title: 'Ahorro', subtitle: '33%'),
                    SizedBox(width: 22),
                    CustomSmallInfoCard(
                      title: 'Gastos',
                      subtitle: '33%',
                      iconBackgroundColor: const Color(0xFFFF9393),
                    ),
                    SizedBox(width: 22),
                    CustomSmallInfoCard(
                      title: 'Ingresos',
                      subtitle: '100%',
                      iconBackgroundColor: const Color(0xFFD9D9D9),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 36),
                  child: Column(
                    children: [
                      const CustomTitleBar(
                        title: 'Ingreso Semanal',
                        subtitle: 'Del 4 al 10 de Febrero',
                      ),
                      const SizedBox(height: 18),
                      // Mapea los datos de los ingresos a CustomTextInfoCard
                      for (var income in incomes)
                        Column(
                          children: [
                            CustomTextInfoCard(
                              title: 'Ingresos',
                              subtitle: income['reason'].toString(),
                              amount: income['amount'].toString(),
                              text: 'DAY',
                              isSaving: true,
                            ),
                            SizedBox(
                                height:
                                    12), // Agrega un SizedBox para la separación
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para obtener el día de la semana actual
  String _getDayOfWeek() {
    switch (DateTime.now().weekday) {
      case 1:
        return 'LUN';
      case 2:
        return 'MAR';
      case 3:
        return 'MIÉ';
      case 4:
        return 'JUE';
      case 5:
        return 'VIE';
      case 6:
        return 'SÁB';
      case 7:
        return 'DOM';
      default:
        return '';
    }
  }
}
