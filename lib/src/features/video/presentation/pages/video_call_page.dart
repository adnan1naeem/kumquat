import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_button_rounded.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/helper/app_colors.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';

@RoutePage<void>()
class VideoCallPage extends StatelessWidget {
  const VideoCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          child: Image.asset(
            AssetHelper.videoPlaceholder,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
            child: IconButton(
                onPressed: () {
                  context.router.maybePop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 30,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.15,
              vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time Lapsed:',
                    style: AppStyles.text16Normal.white,
                  ),
                  horizontalSpace(20),
                  Text(
                    '3 min 33 sec',
                    style: AppStyles.text16Normal.white,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cost :',
                    style: AppStyles.text16Normal.white,
                  ),
                  horizontalSpace(20),
                  Text(
                    '\$8.48',
                    style: AppStyles.text16Normal.white,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wallet:',
                    style: AppStyles.text16Normal.white,
                  ),
                  horizontalSpace(20),
                  Text(
                    '\$310',
                    style: AppStyles.text16Normal.white,
                  )
                ],
              ),
              verticalSpace(20),
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
        )
      ],
    ));
  }
}
