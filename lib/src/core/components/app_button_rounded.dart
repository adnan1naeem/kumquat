import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/helper/app_colors.dart';



class AppButtonRounded extends StatelessWidget {
  const AppButtonRounded({
    super.key,
    this.height = 50,
    required this.icon,
    this.padding = 8.0,
  });
  final double height;
  final Widget icon;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding:  EdgeInsets.all(padding),
        child: icon,
      ),
    );
  }
}
