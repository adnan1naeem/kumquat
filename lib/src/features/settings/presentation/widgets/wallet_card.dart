import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';

import '../../../../core/components/custom_app_button.dart';
import '../../../../core/components/custom_app_container.dart';
import '../../../../core/theme/app_styles.dart';



class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.balance,
    required this.tap,
  });
  final double balance;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return CustomAppContainer(
        contentPadding: 15,
        padding: 0,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Balance', style: AppStyles.text16w500.secTextColor,),
                Text('\$$balance', style: AppStyles.text20Bold.secondaryColor,)
              ],
            ),
            CustomAppButton(
              onTap: tap,
              titleText: 'Add Funds',
              isOutlined: true,
              radius: 10,
              height: 30,
            )
          ],
        )
    );
  }
}
