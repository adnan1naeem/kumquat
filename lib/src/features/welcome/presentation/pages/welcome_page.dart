import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/constants/app_strings.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';
import '../../../../core/components/eclipse_header.dart';
import '../widgets/welcome_button.dart';
import '../widgets/welcome_widget.dart';

@RoutePage<void>()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const EclipseHeader(),
          verticalSpace(100),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const WelcomeWidget(),
                verticalSpace(90),
                WelcomeButton(
                  labelText: AppStrings.loginLabel,
                  buttonLabel: 'Login',
                  onTap: () {
                    context.router.push(const LoginRoute());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Or',
                    style: AppStyles.text16w700.primaryColor,
                  ),
                ),
                WelcomeButton(
                    labelText: AppStrings.registerLabel,
                    buttonLabel: 'Register',
                    onTap: () {
                      context.router.push(const RegisterRoute());
                    }),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
