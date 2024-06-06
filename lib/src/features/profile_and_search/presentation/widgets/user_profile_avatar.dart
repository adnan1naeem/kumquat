import 'package:flutter/material.dart';

import '../../../../core/helper/app_colors.dart';

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.violet.withOpacity(0.5),
          borderRadius: BorderRadius.circular(120)),
      child: Container(
        // height: 10,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: AppColors.violet.withOpacity(0.85),
            borderRadius: BorderRadius.circular(120)),
        child: CircleAvatar(radius: 50, backgroundImage: AssetImage(image)),
      ),
    );
  }
}
