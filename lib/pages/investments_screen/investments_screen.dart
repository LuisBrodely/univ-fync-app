import 'package:flutter/material.dart';
import 'package:fync_app/pages/investments_screen/widgets/custom_revenue_box.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_button.dart';

class InvestmentsScreen extends StatelessWidget {
  const InvestmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBarButtons(
              leftButtonColor: Colors.white, rightButtonColor: Colors.white),
        ),
        backgroundColor: const Color(0xFF222222),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 30),
          child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Resumen de Inversiones',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFFFAFAFA),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '2 de Febrero del 2024 (Hoy)',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xFFDCEF64),
                ),
              ),
              const SizedBox(height: 60),
              const CustomRevenueBox(
                firstText: 'Tarjeta NU',
                secondText: '15% Interes Compuesto',
                thirdText: '\$32,023.00',
                fourthText: '+\$13,20.00',
                boxColor: Color(0xFF9903D6),
                firstTextColor: Color(0xFFE6A9FF),
              ),
              const SizedBox(height: 20),
              const CustomRevenueBox(
                firstText: 'Acciones Meta',
                secondText: '+8% Hoy',
                thirdText: '\$23,023.00',
                fourthText: '+\$10,20.00',
                boxColor: Color(0xFF0867E0),
                firstTextColor: Color(0xFFACD1FF),
              ),
              const SizedBox(height: 20),
              const CustomRevenueBox(
                firstText: 'Acciones Amazon',
                secondText: '-10% Hoy',
                thirdText: '\$13,023.00',
                fourthText: '-\$13,20.00',
                boxColor: Color(0xFFF8972C),
                firstTextColor: Color(0xFFFFDAB2),
              ),
              const SizedBox(height: 200),
              CustomButton(
                text: 'Añadir inversión',
                backgroundColor: const Color(0xFFDCEF64),
                borderColor: const Color(0xFFDCEF64),
                textColor: const Color(0xFF282828),
                onPressed: () {},
              ),
            ]),
          ),
        ));
  }
}
