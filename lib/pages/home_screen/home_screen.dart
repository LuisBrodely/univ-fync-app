import 'package:flutter/material.dart';
import 'package:fync_app/pages/home_screen/widgets/circular_icon_button.dart';
import 'package:fync_app/pages/home_screen/widgets/custom_app_bar.dart';
import 'package:fync_app/pages/home_screen/widgets/custom_info_box.dart';
import 'package:fync_app/services/auth_service.dart';
import 'package:fync_app/widgets/general/custom_info_card.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';
import 'package:fync_app/services/bank_service.dart'; // Importa tu servicio BankService

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> expenses = []; // Lista para almacenar los gastos
  String userName = '';
  final AuthService _authService = AuthService(); // Instancia de AuthService

  @override
  void initState() {
    super.initState();
    _getExpenses();
  }

  void _getExpenses() async {
    try {
      final userId = await _authService.getUserId();
      final name = await _authService.getUserName();
      final List<Map<String, dynamic>> expensesData =
          await BankService().getExpenses(userId ?? '');
      setState(() {
        expenses = expensesData;
        userName = name ?? '';
      });
    } catch (e) {
      print('Error al obtener los gastos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 60),
        children: [
            CustomAppBar(
            title: 'Mi Cartera',
            subtitle: 'Hola, $userName',
            imageUrl:
                'https://th.bing.com/th/id/R.314e2b87af0963913d9b2e72c116ce10?rik=CTZd%2bEYB2upQ0w&pid=ImgRaw&r=0',
          ),
          const SizedBox(height: 50),
          const CustomInfoBox(),
          const SizedBox(height: 20),
          const FourCircularButtons(),
          const SizedBox(height: 22),
          Container(
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: const Color(0xFFA4A4A4),
            ),
          ),
          const SizedBox(height: 22),
          const CustomTitleBar(
            title: 'Ultimos Gastos',
            subtitle: '2 de Febrero del 2024',
          ),
          const SizedBox(height: 18),
          // Mapea los datos de los gastos a CustomInfoCard
          for (var expense in expenses)
            Column(
              children: [
                CustomInfoCard(
                  iconData: _getIconData(expense['priority']),
                  title: 'Gasto',
                  subtitle: expense['establishment'],
                  amount: expense['amount'],
                ),
                SizedBox(height: 12), // Agrega un SizedBox para la separación
              ],
            ),
        ],
      ),
    );
  }

  // Función para obtener el IconData basado en la prioridad del gasto
  IconData _getIconData(String priority) {
    switch (priority) {
      case '1':
        return Icons.priority_high;
      case '2':
        return Icons.warning;
      case '3':
        return Icons.info;
      default:
        return Icons.info;
    }
  }
}
