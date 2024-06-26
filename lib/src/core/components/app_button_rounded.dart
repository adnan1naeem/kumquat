import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/helper/app_colors.dart';



class AppButtonRounded extends StatelessWidget {
  const AppButtonRounded({
    super.key,
    this.height = 50,
    required this.icon,
    this.padding = 8.0,
    required this.tap,
    this.backgroundColor = AppColors.secondaryColor
  });
  final double height;
  final Widget icon;
  final double padding;
  final VoidCallback tap;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: height,
        width: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding:  EdgeInsets.all(padding),
          child: icon,
        ),
      ),
    );
  }
}
