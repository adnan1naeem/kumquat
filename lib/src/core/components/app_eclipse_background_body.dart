import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/eclipse_header.dart';

class AppEclipseBackgroundBody extends StatelessWidget {
  const AppEclipseBackgroundBody({
    super.key,
    required this.height,
    required this.child,
  });
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EclipseHeader(
          height: height,
        ),
        child
      ],
    );
  }
}
