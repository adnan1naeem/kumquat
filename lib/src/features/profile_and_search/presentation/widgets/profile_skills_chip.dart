import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';

import '../../../../core/helper/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class ProfileSkillsChip extends StatelessWidget {
  const ProfileSkillsChip({
    super.key,
    required this.skillText,
  });
  final String skillText;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 35,
      width: skillText.length< 18 ? 120: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.grey,
      ),
      child: Center(child: Text(skillText, style: AppStyles.text14.secTextColor,)),
    );
  }
}
