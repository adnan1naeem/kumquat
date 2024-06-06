import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import '../helper/app_colors.dart';
import '../theme/app_styles.dart';



class CustomSnackbar{

  static SnackBar error (String message){
    return  SnackBar(
      backgroundColor: AppColors.red!.withOpacity(0.8),
      content: Text(message, style: AppStyles.text16Normal.white,),
    );
  }

  static SnackBar normal (String message){
    return  SnackBar(
      backgroundColor: AppColors.primaryColor.withOpacity(0.8),
      content: Text(message, style: AppStyles.text16Normal.white,),
    );
  }

}