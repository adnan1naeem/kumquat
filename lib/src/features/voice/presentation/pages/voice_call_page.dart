import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_container.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';

import '../../../../core/components/app_button_rounded.dart';
import '../../../../core/helper/app_colors.dart';
import '../../../profile_and_search/presentation/widgets/user_profile_avatar.dart';

@RoutePage<void>()
class VoiceCallPage extends StatelessWidget {
  const VoiceCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
      appbar: const CustomAppbar(titleText: '', allowBackNav: true,),
      body: AppEclipseBackgroundBody(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15.0, bottom: 80),
            child: Column(
              children: [
                Text('Phone chat with User', style: AppStyles.text20Bold.white,),
                verticalSpace(20),
                const Align(
                  alignment: Alignment.center,
                  child: UserProfileAvatar(
                    image: AssetHelper.placeholder,
                  ),
                ),
                expandedSpacer(),
                const Divider(),
                verticalSpace(15),
                CustomAppContainer(
                  padding: 0,
                  contentPadding: 30,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time Lapsed:',
                            style: AppStyles.text16Bold.primaryTextColor,
                          ),
                          horizontalSpace(20),
                          Text(
                            '3 min 33 sec',
                            style: AppStyles.text16Normal.secTextColor,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cost :',
                            style: AppStyles.text16Bold.primaryTextColor,
                          ),
                          horizontalSpace(20),
                          Text(
                            '\$8.48',
                            style: AppStyles.text16Normal.secTextColor,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wallet:',
                            style: AppStyles.text16Bold.primaryTextColor,
                          ),
                          horizontalSpace(20),
                          Text(
                            '\$310',
                            style: AppStyles.text16Normal.secTextColor,
                          )
                        ],
                      ),
                    ],),
                ),
                expandedSpacer(),
                AppButtonRounded(
                  backgroundColor: AppColors.raspberryRed,
                  icon: const Icon(
                    Icons.phone_outlined,
                    color: AppColors.white,
                  ),
                  tap: () {},
                ),
              ],
            ),
          ),),
    );
  }
}
