import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';

import '../helper/app_colors.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    required this.hintText,
    this.onSubmit,
    this.onChanged,
    required this.controller,
    this.isPasswordField = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.isExpanded = false,
    this.type = TextInputType.text,
    this.onValidate,
    this.fillColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
    this.textstyle,
    this.hintStyle,
    this.readOnly = false
  });
  final String hintText;
  final VoidCallback? onSubmit;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final bool isPasswordField;
  final Widget? suffixIcon;
  final int maxLines;
  final bool isExpanded;
  final TextInputType type;
  final FormFieldValidator<String>? onValidate;
  final Color? fillColor;
  final EdgeInsets padding;
  final TextStyle? textstyle;
  final TextStyle? hintStyle;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: isExpanded,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      cursorWidth: 1.0,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged ?? (String? val){},
      readOnly: readOnly,
      style: textstyle ?? AppStyles.text14.primaryTextColor,
      validator: onValidate,
      obscureText: isPasswordField,
      maxLines: maxLines,
      keyboardType: type,
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
          hintText:  hintText,
          hintStyle: hintStyle ??AppStyles.text14.secTextColor ,
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: suffixIcon,
          ),
          fillColor: fillColor ?? AppColors.lightGrey,
          contentPadding: padding,
          focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(
                  color: fillColor ??  AppColors.primaryColor,
                  width: 1.0
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(
                  color: fillColor ??  AppColors.lightGrey,
                  width: 1.0
              ),
              borderRadius: BorderRadius.circular(10)
          ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:  BorderSide(
                color:  AppColors.red!,
                width: 1.0
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        errorBorder: OutlineInputBorder(
            borderSide:  BorderSide(
                color: AppColors.red!,
                width: 1.0
            ),
            borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}
