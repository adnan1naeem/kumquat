import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';

import '../../../../core/components/custom_dropdown_button.dart';




class NewProfileDropdownWidget extends StatelessWidget {
  const NewProfileDropdownWidget({
    super.key,
    required this.dropdown,
    required this.labelText
  });
  final String labelText;
  final CustomDropdownButton dropdown;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppStyles.text14Bold,),
        verticalSpace(8),
        dropdown
      ],
    );
  }
}