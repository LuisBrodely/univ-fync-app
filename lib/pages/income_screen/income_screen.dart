import 'package:flutter/material.dart';
import 'package:fync_app/pages/expenses_screen/widgets/custon_row_with_text_field.dart';
import 'package:fync_app/pages/income_screen/widgets/custom_addition_box.dart';
import 'package:fync_app/pages/income_screen/widgets/add_income_buttons.dart';
import 'package:fync_app/services/auth_service.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';
import 'package:fync_app/services/bank_service.dart'; // Importa tu servicio BankService

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  List<Map<String, dynamic>> incomes = [];
  final AuthService _authService = AuthService();
  double totalIncome = 0; // Variable para almacenar el total de los ingresos

  @override
  void initState() {
    super.initState();
    _getIncomes();
  }

  void _getIncomes() async {
    try {
      final userId = await _authService.getUserId();
      final List<Map<String, dynamic>> incomesData =
          await BankService().getIncomes(userId ?? '');

      // Calcula el total de los gastos
      double totalInc = 0;
      for (var income in incomesData) {
        totalInc += income['amount'];
      }
      setState(() {
        incomes = incomesData;
        totalIncome = totalInc;
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
        child: CustomAppBarButtons(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAdditionBox(totalIncome: totalIncome.toStringAsFixed(2)),
              const SizedBox(height: 24),
              const CustomTitleBar(title: 'Lista de Ingresos', subtitle: ''),
              const SizedBox(height: 18),
              // Usar un bucle for para mostrar los ingresos
              for (var income in incomes)
                Column(
                  children: [
                    CustomRowWithTextField(
                      nameHintText: income['reason'].toString(),
                      amountHintText: income['amount'].toString(),
                      backgroundBox: const Color(0xFFDCEF64),
                      iconColor: const Color(0xFF282828),
                      onRemovePressed: () {},
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              AddIncomeButtons(
                onAddExpensePressed: () {},
                onCreateFixedExpensePressed: () {},
                onCreateCategoryPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
