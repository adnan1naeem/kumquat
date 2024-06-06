import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';
import 'package:kumquat_app/src/core/helper/formfield_validators.dart';
import '../../../../core/components/custom_app_button.dart';
import '../../../../core/components/eclipse_header.dart';
import '../../../../core/helper/asset_helper.dart';
import '../../../../core/helper/helper_functions.dart';
import '../../../../core/helper/space.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../widgets/auth_form_field_widget.dart';

@RoutePage<void>()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isHidePass = true;
  bool isHideConfirmPass = true;
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resize: true,
        body: GestureDetector(
          onTap: (){
            getFocus(context);
          },
          child: Column(
                children: [
          const EclipseHeader(
            height: 80,
            isBackAllow: true,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AssetHelper.appLogo),
                          verticalSpace(40),
                          AuthFormFieldWidget(
                            controller: userIDController,
                            labelText: 'User ID',
                            hintText: 'Enter Your User ID',
                            validator: FormfieldValidators.userNameValidator,
                            onChanged: (val) {},
                          ),
                          verticalSpace(15),
                          AuthFormFieldWidget(
                            controller: passwordController,
                              labelText: 'Password',
                              onChanged: (val) {},
                              validator: FormfieldValidators.passwordValidator,
                              hintText: 'Enter your Password',
                              isPassword: isHidePass,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHidePass = !isHidePass;
                                  });
                                },
                                child: SvgPicture.asset(
                                  isHidePass
                                      ? AssetHelper.hideIcon
                                      : AssetHelper.showIcon,
                                ),
                              )),
                          verticalSpace(15),
                          AuthFormFieldWidget(
                            controller:  confirmPasswordController,
                              labelText: 'Confirm Password',
                              onChanged: (val) {},
                              validator: FormfieldValidators.passwordValidator,
                              hintText: 'Enter your Password',
                              isPassword: isHideConfirmPass,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isHideConfirmPass = !isHideConfirmPass;
                                  });
                                },
                                child: SvgPicture.asset(
                                  isHideConfirmPass
                                      ? AssetHelper.hideIcon
                                      : AssetHelper.showIcon,
                                ),
                              ))
                        ],
                      ),
                      verticalSpace(40),
                      CustomAppButton(
                          titleText: 'Create',
                          onTap: () {
                            if(key.currentState!.validate()){
                              context.router.push(const NewProfileRouteOne());
                            }else{
                              showSnackBar(context, 'Fill all the required fields!', 'error');
                            }

                          })
                    ],
                  ),
                ),
              ),
            ),
          )
                ],
              ),
        ));
  }
}
