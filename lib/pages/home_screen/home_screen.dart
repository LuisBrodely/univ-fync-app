import 'package:flutter/material.dart';
import 'package:fync_app/pages/home_screen/widgets/circular_icon_button.dart';
import 'package:fync_app/pages/home_screen/widgets/custom_app_bar.dart';
import 'package:fync_app/pages/home_screen/widgets/custom_info_box.dart';
import 'package:fync_app/widgets/general/custom_info_card.dart';
import 'package:fync_app/widgets/general/custom_title_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 60),
          child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CustomAppBar(
                  title: 'Mi Cartera',
                  subtitle: 'Hola, Brodely Tovar',
                  imageUrl:
                      'https://scontent-dfw5-2.xx.fbcdn.net/v/t39.30808-6/352336737_3576726865896497_1627286230545824668_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeEWI_RFKKzgZ5la2qfbKmLNGT8QTm_0jA4ZPxBOb_SMDv3aa3xvAuRgV_CdLPlkB38jQKWR3L-c2IVGlha_caVT&_nc_ohc=sxQdb2V4HtgAX9qXyvK&_nc_ht=scontent-dfw5-2.xx&oh=00_AfBz-Tc4u4vEHsQgOEmNxrOdeHlh6UYFB451i_cEIng6yA&oe=65ED260E'),
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
                  title: 'Ultimos Gastos', subtitle: '2 de Febrero del 2024'),
              const SizedBox(height: 18),
              const CustomInfoCard(
                iconData: Icons.favorite_outline,
                title: 'Ocio',
                subtitle: 'Netflix (Gasto Fijo)',
                amount: '300.00',
              ),
              const SizedBox(height: 12),
              const CustomInfoCard(
                iconData: Icons.account_balance_wallet_outlined,
                title: 'Ocio',
                subtitle: 'Netflix (Gasto Fijo)',
                amount: '300.00',
                iconColor: Color(0xFFFAFAFA),
                iconBackgroundColor: Color(0xFFFF9393),
              ),
              const SizedBox(height: 12),
              const CustomInfoCard(
                iconData: Icons.school_outlined,
                title: 'Educación',
                subtitle: 'Curso Angular',
                amount: '300.00',
              ),
              const SizedBox(height: 12),
              const CustomInfoCard(
                iconData: Icons.fastfood_outlined,
                title: 'Alimentación',
                subtitle: 'Cafeteria UP',
                amount: '300.00',
                iconColor: Color(0xFFFAFAFA),
                iconBackgroundColor: Color(0xFFFF9393),
              ),
              const SizedBox(height: 12),
              const CustomInfoCard(
                iconData: Icons.directions_car_outlined,
                title: 'Transporte',
                subtitle: 'Uber',
                amount: '300.00',
              ),
              const SizedBox(height: 12),
              const CustomInfoCard(
                iconData: Icons.cottage_outlined,
                title: 'Casa',
                subtitle: 'Luz (Gasto Fijo)',
                amount: '300.00',
                iconColor: Color(0xFFFAFAFA),
                iconBackgroundColor: Color(0xFFFF9393),
              )
            ]),
          ),
        ));
  }
}
