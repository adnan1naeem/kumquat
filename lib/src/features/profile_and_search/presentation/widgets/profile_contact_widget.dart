import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/components/app_button_rounded.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';



class ProfileContactWidget extends StatelessWidget {
  const ProfileContactWidget(
      {super.key,
        required this.title,
        required this.rate,
        required this.icon,
        this.hideRate = false,
        this.padding = 8});
  final String title;
  final double rate;
  final String icon;
  final bool hideRate;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButtonRounded(
          icon: SvgPicture.asset(icon),
          padding: padding,
        ),
        Text(
          title,
          style: AppStyles.text14Bold,
        ),
        hideRate
            ? const SizedBox.shrink()
            : Text(
          '\$$rate  per hour',
          style: AppStyles.text14Bold.secTextColor,
        )
      ],
    );
  }
}
