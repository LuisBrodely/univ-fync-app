import 'package:flutter/material.dart';
import 'package:fync_app/pages/expenses_screen/widgets/add_expensive_buttons.dart';
import 'package:fync_app/pages/expenses_screen/widgets/custom_subtraction_box.dart';
import 'package:fync_app/pages/expenses_screen/widgets/custon_row_with_text_field.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomSubtractionBox(),
              const SizedBox(height: 24),
              const CustomTitleBar(title: 'Lista de Gastos', subtitle: ''),
              const SizedBox(height: 18),
              CustomRowWithTextField(
                nameHintText: 'Salud',
                amountHintText: '\$300.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 32),
              CustomRowWithTextField(
                nameHintText: 'Salud',
                amountHintText: '\$300.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 16),
              CustomRowWithTextField(
                nameHintText: 'Salud',
                amountHintText: '\$300.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 16),
              CustomRowWithTextField(
                nameHintText: 'Salud',
                amountHintText: '\$300.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 280),
              AddExpenseButtons(
                  onAddExpensePressed: () {},
                  onCreateFixedExpensePressed: () {},
                  onCreateCategoryPressed: () {})
            ]),
          ),
        ));
  }
}
