import 'package:flutter/material.dart';
import 'package:fync_app/pages/edit_account_screen/edit_account_screen.dart';
import 'package:fync_app/pages/expenses_screen/expenses_screen.dart';
import 'package:fync_app/pages/home_screen/home_screen.dart';
import 'package:fync_app/pages/income_screen/income_screen.dart';
import 'package:fync_app/pages/login_screen/login_screen.dart';
import 'package:fync_app/pages/presentation_screen/presentation_screen.dart';
import 'package:fync_app/pages/register_screen/register_screen.dart';
import 'package:fync_app/pages/savings_screen/savings_screen.dart';
import 'package:fync_app/pages/investments_screen/investments_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/presentation',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/presentation': (context) => const PresentationScreen(),
        '/home': (context) => const HomeScreen(),
        '/savings': (context) => const SavingsScreen(),
        '/expenses': (context) => const ExpensesScreen(),
        '/income': (context) => const IncomeScreen(),
        '/investments': (context) => const InvestmentsScreen(),
        '/editaccount': (context) => const EditAccountScreen(),
      },
    );
  }
}
