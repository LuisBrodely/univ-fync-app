import 'package:flutter/material.dart';
import 'package:fync_app/pages/expenses_screen/widgets/add_expensive_buttons.dart';
import 'package:fync_app/pages/expenses_screen/widgets/custom_subtraction_box.dart';
import 'package:fync_app/pages/expenses_screen/widgets/custon_row_with_text_field.dart';
import 'package:fync_app/services/auth_service.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';
import 'package:fync_app/services/bank_service.dart'; // Importa tu servicio BankService

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  List<Map<String, dynamic>> expenses = []; // Lista para almacenar los gastos
  final AuthService _authService = AuthService(); // Instancia de AuthService
  double totalExpense = 0; // Variable para almacenar el total de los gastos

  @override
  void initState() {
    super.initState();
    _getExpenses(); // Obtener los gastos al iniciar la pantalla
  }

  // Método para obtener los gastos
  void _getExpenses() async {
    try {
      final userId = await _authService.getUserId();
      final List<Map<String, dynamic>> expensesData =
          await BankService().getExpenses(userId ?? '');

      // Calcula el total de los gastos
      double totalExp = 0;
      for (var expense in expensesData) {
        totalExp += double.parse(expense['amount']);
      }

      setState(() {
        expenses = expensesData; // Actualiza la lista de gastos
        totalExpense = totalExp;
      });
    } catch (e) {
      print('Error al obtener los gastos: $e');
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
              CustomSubtractionBox(totalExpense: totalExpense.toStringAsFixed(2)),
              const SizedBox(height: 24),
              const CustomTitleBar(title: 'Lista de Gastos', subtitle: ''),
              const SizedBox(height: 18),
              // Usar un bucle for para mostrar los gastos
              for (var expense in expenses)
                Column(
                  children: [
                    CustomRowWithTextField(
                      nameHintText:
                          expense['establishment'], // Establecimiento del gasto
                      amountHintText:
                          expense['amount'].toString(), // Monto del gasto
                      onRemovePressed: () {},
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              AddExpenseButtons(
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
