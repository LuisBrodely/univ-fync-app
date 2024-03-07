import 'package:flutter/material.dart';
import 'package:fync_app/pages/expenses_screen/widgets/custon_row_with_text_field.dart';
import 'package:fync_app/pages/income_screen/widgets/custom_addition_box.dart';
import 'package:fync_app/pages/income_screen/widgets/add_income_buttons.dart';
import 'package:fync_app/widgets/general/custom_app_bar_buttons.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({Key? key}) : super(key: key);

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
              const CustomAdditionBox(),
              const SizedBox(height: 24),
              const CustomTitleBar(title: 'Lista de Ingresos', subtitle: ''),
              const SizedBox(height: 18),
              CustomRowWithTextField(
                nameHintText: 'Personalizado',
                amountHintText: '\$120.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 32),
              CustomRowWithTextField(
                nameHintText: 'Salario (Fijo M)',
                amountHintText: '\$20,000.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 16),
              CustomRowWithTextField(
                nameHintText: 'Regalo',
                amountHintText: '\$1070.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 16),
              CustomRowWithTextField(
                nameHintText: 'Intereses',
                amountHintText: '\$310.00',
                onRemovePressed: () {},
              ),
              const SizedBox(height: 280),
              AddIncomeButtons(
                  onAddExpensePressed: () {},
                  onCreateFixedExpensePressed: () {},
                  onCreateCategoryPressed: () {})
            ]),
          ),
        ));
  }
}
