import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import '../helper/app_colors.dart';
import '../theme/app_styles.dart';

class AppColoredTextBar extends StatelessWidget {
  const AppColoredTextBar({
    super.key,
    required this.title,
    this.radius = 12,
    this.topRadius = false
  });
  final String title;
  final double radius;
  final bool topRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: topRadius ?  BorderRadius.vertical(
            top: Radius.circular(radius)
        ): null
      ),
     
      child: Center(child: Text(title, style: AppStyles.text16w700.white,)),
    );
  }
}
