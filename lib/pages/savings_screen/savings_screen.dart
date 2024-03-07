import 'package:flutter/material.dart';
import 'package:fync_app/pages/savings_screen/widgets/custom_circular_chart.dart';
import 'package:fync_app/pages/savings_screen/widgets/custom_small_info_card.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_text_info_card.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBarButtons(
              leftButtonColor: Colors.white, rightButtonColor: Colors.white),
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
                            iconBackgroundColor: Color(0xFFFF9393)),
                        SizedBox(width: 22),
                        CustomSmallInfoCard(
                            title: 'Ingresos',
                            subtitle: '100%',
                            iconBackgroundColor: Color(0xFFD9D9D9))
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 36),
                      child: const Column(
                        children: [
                          CustomTitleBar(
                            title: 'Ahorros Semanales',
                            subtitle: 'Del 4 al 10 de Febrero',
                          ),
                          SizedBox(height: 18),
                          CustomTextInfoCard(
                            title: '¡Bien Hecho!',
                            subtitle: '6 de Febrero del 2024',
                            amount: '1000.00',
                            text: 'MIE',
                            isSaving: true,
                          ),
                          SizedBox(height: 12),
                          CustomTextInfoCard(
                            title: '¡Puedes mejorar!',
                            iconBackgroundColor: Color(0xFFDCEF64),
                            iconColor: Color(0xFF282828),
                            subtitle: '5 de Febrero del 2024',
                            amount: '1000.00',
                            text: 'MAR',
                            isSaving: true,
                          ),
                          SizedBox(height: 12),
                          CustomTextInfoCard(
                            title: '¡Asi se hace!',
                            subtitle: '4 de Febrero del 2024',
                            amount: '1000.00',
                            text: 'LUN',
                            isSaving: true,
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }
}
