import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';

import '../../../../core/helper/app_colors.dart';



class RadioTileWidget extends StatelessWidget {
  const RadioTileWidget({
    super.key,
    required this.tileTitle,
    required this.value,
    required this.selected,
    required this.onChanged,
  });
  final String tileTitle;
  final String selected;
  final String value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1,
          child: Radio( value: value,
            groupValue: selected,
            visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
            onChanged: (val)=>onChanged(val),
            toggleable: true,
            fillColor: selected == value ? null:  MaterialStateProperty.resolveWith((states) => AppColors.secondaryTextColor),
            activeColor: AppColors.secondaryColor,
          ),
        ),
        Text(tileTitle, style: selected == value? AppStyles.text14w600.secondaryColor: AppStyles.text14w600.secTextColor,)
      ],
    );
  }
}
