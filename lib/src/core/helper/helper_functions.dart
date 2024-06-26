import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/custom_snackbar.dart';


showSnackBar(BuildContext context, String message, String type){
 return  ScaffoldMessenger.of(context).showSnackBar(
   type == 'error' ? CustomSnackbar.error(message) : CustomSnackbar.success(message)
  );
}