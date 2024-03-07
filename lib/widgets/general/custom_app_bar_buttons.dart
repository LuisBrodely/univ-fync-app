import 'package:flutter/material.dart';

class CustomAppBarButtons extends StatelessWidget {
  final Color leftButtonColor;
  final Color rightButtonColor;
  final VoidCallback? onRightPressed;

  const CustomAppBarButtons({
    Key? key,
    this.leftButtonColor = Colors.black,
    this.rightButtonColor = Colors.black,
    this.onRightPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: AppBarButton(
        icon: Icons.arrow_back_ios,
        color: leftButtonColor,
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
      actions: [
        AppBarButton(
          icon: Icons.menu,
          color: rightButtonColor,
          onPressed: () {},
        ),
      ],
    );
  }
}

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  const AppBarButton({
    Key? key,
    required this.icon,
    this.color = Colors.black,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        onPressed: onPressed,
      ),
    );
  }
}
