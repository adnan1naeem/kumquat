import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/helper/app_colors.dart';

extension TypographyExtensions on TextStyle {
  TextStyle get primaryColor => copyWith(color: AppColors.primaryColor);
  TextStyle get primaryTextColor => copyWith(color: AppColors.primaryTextColor);
  TextStyle get secTextColor => copyWith(color: AppColors.secondaryTextColor);
  TextStyle get secondaryColor => copyWith(color: AppColors.secondaryColor);
  TextStyle get secondaryLight => copyWith(color: AppColors.secondaryColor.withOpacity(0.3));
  TextStyle get white => copyWith(color: AppColors.white);
}
