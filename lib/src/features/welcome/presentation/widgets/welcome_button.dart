


import 'package:flutter/material.dart';

import '../../../../core/components/custom_app_button.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/space.dart';
import '../../../../core/theme/app_styles.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.labelText,
    required this.buttonLabel,
    required this.onTap
  });
  final String labelText;
  final String buttonLabel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppStyles.text16w700,),
        verticalSpace(10),
        CustomAppButton(titleText: buttonLabel, onTap: onTap, width: MediaQuery.sizeOf(context).width,),
      ],
    );
  }
}
