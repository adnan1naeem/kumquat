import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';

import '../../../../core/helper/space.dart';
import '../../../../core/theme/app_styles.dart';


class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.name,
    required this.score,
    required this.reviewText,
  });
  final String name;
  final double score;
  final String reviewText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  name,
                  style: AppStyles.text14Bold.secondaryColor,
                ),
                Text(
                  reviewText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyles.text14.secTextColor,
                ),
              ],
            ),
          ),
          Text(
            '$score/10',
            style: AppStyles.text14.secondaryLight,
          ),
        ],
      ),
    );
  }
}
