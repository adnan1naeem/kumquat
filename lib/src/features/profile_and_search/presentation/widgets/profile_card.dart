import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';

import '../../../../core/components/custom_app_container.dart';
import '../../../../core/helper/space.dart';
import '../../../../core/theme/app_styles.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.score,
    required this.kumquats,
    required this.about,
    required this.onTap
  });
  final String name;
  final double score;
  final int kumquats;
  final String about;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: CustomAppContainer(
          height: 100,
          padding: 5,
          contentPadding: 10,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AssetHelper.placeholder),
              ),
              horizontalSpace(15.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: AppStyles.text14Bold.secondaryColor,
                        ),
                        Text(
                          'Score $score , $kumquats Kumquats',
                          style: AppStyles.text14.secondaryLight,
                        ),
                      ],
                    ),
                    Text(
                      about,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppStyles.text14.secTextColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
