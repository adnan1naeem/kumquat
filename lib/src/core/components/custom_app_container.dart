import 'package:flutter/material.dart';

import '../helper/app_colors.dart';

class CustomAppContainer extends StatelessWidget {
  const CustomAppContainer({
    super.key,
    this.height,
    this.width = double.infinity,
    required this.child,
    this.padding = 20,
    this.contentPadding =0
  });
  final double? height;
  final double? width;
  final Widget child;
  final double padding;
  final double contentPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(padding),
      child: Container(
        height: height,
        width: width,
          padding: EdgeInsets.all(contentPadding),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 6.0,
                ),
              ]),
          child: child),
    );
  }
}
