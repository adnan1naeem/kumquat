import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/bloc.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/event.dart';
import '../helper/app_colors.dart';
import '../helper/asset_helper.dart';
import '../theme/app_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key,
      required this.titleText,
      this.allowBackNav = false,
      this.height = 60,
      this.isSettingsScreen = false});
  final String titleText;
  final bool allowBackNav;
  final double height;
  final bool isSettingsScreen;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: allowBackNav,
      title: Text(
        titleText,
        style: AppStyles.text20Bold.white,
      ),
      actions: [
        // IconButton(onPressed: (){}, visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0), icon: const Icon(Icons.search, color: AppColors.white,)),
        isSettingsScreen
            ? const SizedBox.shrink()
            : IconButton(
                onPressed: () {
                  context.router.push(SettingsRoute());
                },
                visualDensity:
                    const VisualDensity(horizontal: -4.0, vertical: -4.0),
                icon: const Icon(
                  Icons.settings,
                  color: AppColors.white,
                )),
        IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(DoLogout());
              context.router.replaceAll([const WelcomeRoute()]);
            },
            visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4.0),
            icon: SvgPicture.asset(
              AssetHelper.appLogo,
              width: 20,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
