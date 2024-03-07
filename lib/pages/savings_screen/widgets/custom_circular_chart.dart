import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomCircularChart extends StatelessWidget {
  const CustomCircularChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Column(
          children: [
            Text(
              '\$44,672.00',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Mensual',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC8C8C8),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 280,
          height: 280,
          child: PieChart(
            swapAnimationDuration: const Duration(milliseconds: 750),
            swapAnimationCurve: Curves.easeInOutQuint,
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 33,
                  color: const Color(0xFFDCEF64),
                ),
                PieChartSectionData(
                  value: 33,
                  color: const Color(0xFFFF9393),
                ),
                PieChartSectionData(
                  value: 34,
                  color: const Color(0xFFFAFAFA),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
