import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appbar,
    this.resize = false,
  });
  final Widget body;
  final CustomAppbar? appbar;
  final bool resize;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appbar,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: resize,
      body: body,
    ));
  }
}
