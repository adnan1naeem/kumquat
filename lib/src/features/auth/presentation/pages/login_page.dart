import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/eclipse_header.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';
import 'package:kumquat_app/src/core/helper/helper_functions.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/bloc.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/event.dart';
import '../../../../core/helper/formfield_validators.dart';
import '../../blocs/auth/state.dart';
import '../widgets/auth_form_field_widget.dart';

@RoutePage<void>()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHide = true;
  final formKey = GlobalKey<FormState>();
  AuthBloc? bloc;

  @override
  void initState() {
    bloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getFocus(context);
      },
      child: AppScaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess && state.isLoggedIn){
              showSnackBar(context, 'Login Succesfull!', 'success');
              context.router.replaceAll([FindUsersRoute()]);
            }
            if(state is AuthError && state.isLoggedIn){
              showSnackBar(context, state.error, 'error');
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  const EclipseHeader(
                    height: 80,
                    isBackAllow: true,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 30.0),
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
                                  controller: emailController,
                                  hintText: 'Enter Your Email',
                                  onChanged: (val) {},
                                  validator:
                                      FormfieldValidators.emailValidator,
                                  labelText: 'Email',
                                  isForgot: true,
                                  forgotLabelText: 'Forgot Email?',
                                ),
                                verticalSpace(15),
                                AuthFormFieldWidget(
                                  controller: passwordController,
                                  labelText: 'Password',
                                  isForgot: true,
                                  forgotLabelText: 'Forgot Password?',
                                  hintText: 'Enter Your Password',
                                  onChanged: (val) {
                                  },
                                  validator:
                                      FormfieldValidators.passwordValidator,
                                  isPassword: isHide,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isHide = !isHide;
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      isHide
                                          ? AssetHelper.hideIcon
                                          : AssetHelper.showIcon,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            CustomAppButton(
                                titleText: 'Login',
                                isLoading: state is AuthLoading && state.showIndicator,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    bloc!.add(DoLogin(email: emailController.text, password: passwordController.text));
                                  } else {
                                    showSnackBar(
                                        context,
                                        'Fill all the required fields!',
                                        'error');
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
