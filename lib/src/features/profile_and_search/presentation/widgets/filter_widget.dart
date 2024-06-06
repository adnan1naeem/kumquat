import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';

import '../../../../core/components/app_formfield.dart';
import '../../../../core/components/custom_app_button.dart';
import '../../../../core/helper/app_colors.dart';
import '../../../../core/helper/asset_helper.dart';
import '../../../../core/helper/space.dart';
import '../../../../core/theme/app_styles.dart';



class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppFormField(
          hintText: 'Search Term...',
          onChanged: (val) {},
          controller: controller,
          fillColor: AppColors.primaryTextColor.withOpacity(0.2),
          textstyle: AppStyles.text14.white,
          hintStyle: AppStyles.text14.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomAppButton(
                width: 120,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetHelper.sortIcon,
                      height: 15,
                    ),
                    horizontalSpace(15.0),
                    Text(
                      'Sort By',
                      style: AppStyles.text14.white,
                    )
                  ],
                ),
                onTap: () {}),
            horizontalSpace(15),
            CustomAppButton(
                width: 120,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetHelper.filterIcon,
                      height: 15,
                    ),
                    horizontalSpace(15.0),
                    Text(
                      'Filter By',
                      style: AppStyles.text14.white,
                    )
                  ],
                ),
                onTap: () {}
            )
          ],
        ),
      ],);
  }
}
