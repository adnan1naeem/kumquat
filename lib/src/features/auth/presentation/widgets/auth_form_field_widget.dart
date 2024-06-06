import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_formfield.dart';
import '../../../../core/helper/space.dart';
import '../../../../core/theme/app_styles.dart';

class AuthFormFieldWidget extends StatelessWidget {
  const AuthFormFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.isForgot = false,
    this.forgotLabelText ,
    required this.hintText,
    required this.onChanged,
    this.isPassword = false,
    this.suffixIcon,
    this.maxLines =1,
    required this.validator,
    this.keyboardType = TextInputType.text
  });
  final String labelText;
  final TextEditingController  controller;
  final bool isForgot;
  final String? forgotLabelText;
  final String hintText;
  final Function(String) onChanged;
  final bool isPassword;
  final Widget? suffixIcon;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppStyles.text14Bold,
        ),
        verticalSpace(6),
        AppFormField(
            onChanged: (val)=>onChanged(val),
            onValidate: validator,
            type: keyboardType,
            controller: controller,
            hintText:  hintText,
            isPasswordField: isPassword,
            suffixIcon: suffixIcon,
          maxLines: maxLines,
        ),
        verticalSpace(6),
      isForgot ?  Align(
            alignment: Alignment.centerRight,
            child: Text(
              forgotLabelText!,
              style: AppStyles.text14Bold,
            )) : const SizedBox.shrink(),
      ],
    );
  }
}
