


import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/helper/app_colors.dart';

class AppTheme{

  static ThemeData mainTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textSelectionTheme: const TextSelectionThemeData(
        selectionColor: AppColors.primaryColor,
        selectionHandleColor: AppColors.primaryColor
    ),
    appBarTheme: const AppBarTheme(
      iconTheme:  IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.primaryColor,
    )
  );
}