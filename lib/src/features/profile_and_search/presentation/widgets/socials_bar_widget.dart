import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';
import 'package:kumquat_app/src/core/helper/space.dart';

import '../../../../core/components/app_button_rounded.dart';
import '../../../../core/helper/app_colors.dart';

class SocialsBarWidget extends StatelessWidget {
  const SocialsBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppButtonRounded(
          icon: SvgPicture.asset(
            AssetHelper.linkedinIcon,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          height: 40,
        ),
        AppButtonRounded(
          icon: SvgPicture.asset(
            AssetHelper.fbIcon,
            colorFilter:
            const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          height: 40,
        ),
        AppButtonRounded(
          icon: SvgPicture.asset(
            AssetHelper.instagramIcon,
            colorFilter:
            const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          height: 40,
        ),
        AppButtonRounded(
          icon: SvgPicture.asset(
            AssetHelper.youtubeIcon,
            colorFilter:
            const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
          height: 40,
        ),
      ],
    );
  }
}
