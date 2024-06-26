import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';
import 'package:kumquat_app/src/core/helper/formfield_validators.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/event.dart';
import '../../../../core/components/custom_app_button.dart';
import '../../../../core/components/eclipse_header.dart';
import '../../../../core/helper/asset_helper.dart';
import '../../../../core/helper/helper_functions.dart';
import '../../../../core/helper/space.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../blocs/auth/bloc.dart';
import '../../blocs/auth/state.dart';
import '../widgets/auth_form_field_widget.dart';

@RoutePage<void>()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userIDController = TextEditingController();
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
   AuthBloc? authBloc;
  bool isHidePass = true;
  bool isHideConfirmPass = true;
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resize: true,
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state){
     if(state is AuthSuccess && state.isSignup){
       context.router.push( NewProfileRouteOne(bloc: authBloc!));
     }
     if(state is AuthError){
       showSnackBar(context, state.error, 'error');
     }
    },
    child: BlocBuilder<AuthBloc, AuthState>(
      builder: (context,state){
        return GestureDetector(
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
                                controller: emailContoller,
                                labelText: 'Email',
                                hintText: 'Enter Your email',
                                validator: FormfieldValidators.emailValidator,
                                onChanged: (val) {},
                              ),
                              verticalSpace(15),
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
                                  validator: (value){
                                    if(value != passwordController.text){
                                      return 'Password not same';
                                    }else if(value!.isEmpty){
                                      return 'This field is required';
                                    }else{
                                      return null;
                                    }
                                  },
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
                              isLoading: state is AuthLoading && state.showIndicator,
                              titleText: 'Create',
                              onTap: () {
                                getFocus(context);
                                if(key.currentState!.validate()){
                                  authBloc!.add(
                                      DoSignup(
                                      email: emailContoller.text,
                                          username: userIDController.text,
                                          password: passwordController.text));

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
        );
      },
    )
        ),
    );
  }
}
