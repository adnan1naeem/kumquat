import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/eclipse_header.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';
import 'package:kumquat_app/src/core/helper/helper_functions.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import '../../../../core/helper/formfield_validators.dart';
import '../widgets/auth_form_field_widget.dart';

@RoutePage<void>()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHide = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getFocus(context);
      },
      child: AppScaffold(
          body: Column(
        children: [
          const EclipseHeader(
            height: 80,
            isBackAllow: true,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
              child: Form(
                key: formKey,
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
                          controller: userIdController,
                          hintText: 'Enter Your User ID',
                          onChanged: (val){
                            print('userID: $val');
                          },
                          validator: FormfieldValidators.userNameValidator,
                          labelText: 'User ID',
                          isForgot: true,
                          forgotLabelText: 'Forgot User ID?',
                        ),
                        verticalSpace(15),
                        AuthFormFieldWidget(
                          controller: passwordController,
                          labelText: 'Password',
                          isForgot: true,
                          forgotLabelText: 'Forgot Password?',
                          hintText: 'Enter Your Password',
                          onChanged: (val){
                            // print('password: $val');
                          },
                          validator: FormfieldValidators.passwordValidator,
                          isPassword: isHide,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                isHide = !isHide ;
                              });
                            },
                            child: SvgPicture.asset(
                              isHide ?
                              AssetHelper.hideIcon
                                  : AssetHelper.showIcon ,
                            ),
                          ),
                        )
                      ],
                    ),
                    CustomAppButton(
                        titleText: 'Login',
                        onTap: () {
                          // if(formKey.currentState!.validate()){
                            context.router.replaceAll([const FindUsersRoute()]);
                          // }else{
                          //   showSnackBar(context, 'Fill all the required fields!','error');
                          // }
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
