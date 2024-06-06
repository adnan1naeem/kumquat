import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';

import '../helper/app_colors.dart';
import '../theme/app_styles.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    this.height = 45,
    this.width = double.infinity,
    this.titleText,
    required this.onTap,
    this.padding = EdgeInsets.zero,
    this.child,
    this.radius = 22,
    this.isOutlined = false
  });
  final double height;
  final double width;
  final String? titleText;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final Widget? child;
  final double radius;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: isOutlined? null : MaterialStateProperty.resolveWith(
                  (states) => AppColors.secondaryColor),
              fixedSize: MaterialStateProperty.resolveWith(
                  (states) => Size(width, height)),

              shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                  side: BorderSide(
                    color: isOutlined? AppColors.secondaryColor : Colors.transparent
                  ),
                  borderRadius: BorderRadius.circular(radius)
              ))
          ),
          
          child: child ??
          Text(
            titleText!,
            style: isOutlined ? AppStyles.text14Bold.secondaryColor : AppStyles.text14Bold.white,
          )),
    );
  }
}
