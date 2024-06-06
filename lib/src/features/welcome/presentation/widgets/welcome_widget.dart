import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/asset_helper.dart';
import '../../../../core/helper/space.dart';
import '../../../../core/theme/app_styles.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AssetHelper.appLogo),
        verticalSpace(15),
        Text(
          AppStrings.welcomeText,
          style: AppStyles.text28Bold.primaryColor,
        )
      ],
    );
  }
}
