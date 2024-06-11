import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_profile_image_container.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/custom_app_container.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';
import 'package:kumquat_app/src/core/helper/helper_functions.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/event.dart';
import 'package:kumquat_app/src/features/auth/presentation/widgets/auth_form_field_widget.dart';

import '../../../../core/components/app_colored_text_bar.dart';
import '../../../../core/helper/asset_helper.dart';
import '../../../../core/helper/formfield_validators.dart';
import '../../blocs/auth/bloc.dart';
import '../../blocs/auth/state.dart';
import '../widgets/social_media_tile.dart';

@RoutePage<void>()
class NewProfilePageTwo extends StatefulWidget {
  const NewProfilePageTwo({super.key, required this.bloc});
  final AuthBloc bloc;
  @override
  State<NewProfilePageTwo> createState() => _NewProfilePageTwoState();
}

class _NewProfilePageTwoState extends State<NewProfilePageTwo> {
  TextEditingController phoneRate = TextEditingController();
  TextEditingController videoRate = TextEditingController();
  TextEditingController summary = TextEditingController();
  String linkedin = '';
  String facebook = '';
  String instagram = '';
  String youtube = '';
  File? image;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getFocus(context);
      },
      child: AppScaffold(
          appbar: CustomAppbar(
            titleText: widget.bloc.username,
          ),
          resize: true,
          body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state is AuthSuccess && state.isProfileCreation ){
                  context.router.replaceAll([const LoginRoute()]);
                }
                if(state is AuthError && state.isProfileCreation){
                  showSnackBar(context, state.error, 'error');
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (ctx, state) {
                  return AppEclipseBackgroundBody(
                    height: MediaQuery.sizeOf(context).height * 0.35,
                    child: SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.center,
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  image != null
                                      ? AppProfileImageContainer(
                                          image: FileImage(image!))
                                      : const AppProfileImageContainer(
                                          image: AssetImage(
                                              AssetHelper.placeholder)),
                                  verticalSpace(10),
                                  CustomAppButton(
                                      titleText: 'Upload Photo',
                                      width: 120,
                                      height: 40,
                                      onTap: () async {
                                        FilePickerResult? result =
                                            await FilePicker.platform
                                                .pickFiles();

                                        if (result != null) {
                                          image =
                                              File(result.files.single.path!);
                                          setState(() {});
                                        } else {
                                          // User canceled the picker
                                        }
                                      })
                                ],
                              ),
                              CustomAppContainer(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 20.0),
                                      child: Column(
                                        children: [
                                          AuthFormFieldWidget(
                                            controller: phoneRate,
                                            labelText: 'Phone Chat Rate',
                                            onChanged: (val) {},
                                            validator: FormfieldValidators
                                                .userNameValidator,
                                            hintText:
                                                'Enter amount between \$1 to \$1000',
                                            keyboardType: TextInputType.number,
                                          ),
                                          AuthFormFieldWidget(
                                            controller: videoRate,
                                            labelText: 'Video Chat Rate',
                                            onChanged: (val) {},
                                            validator: FormfieldValidators
                                                .userNameValidator,
                                            hintText:
                                                'Enter amount between \$1 to \$1000',
                                            keyboardType: TextInputType.number,
                                          ),
                                          AuthFormFieldWidget(
                                            controller: summary,
                                            labelText: 'Summary',
                                            onChanged: (val) {},
                                            validator: FormfieldValidators
                                                .userNameValidator,
                                            hintText: 'Max 10,000 characters',
                                            maxLines: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const AppColoredTextBar(
                                      title: 'Social Media',
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 20.0),
                                      child: Column(
                                        children: [
                                          SocialMediaTile(
                                              imagePath:
                                                  AssetHelper.linkedinIcon,
                                              hintText: 'Enter your linkedin',
                                              onChange: (String val) {
                                                linkedin = val;
                                                setState(() {});
                                              }),
                                          SocialMediaTile(
                                              imagePath: AssetHelper.fbIcon,
                                              hintText: 'Enter your facebok',
                                              onChange: (String val) {
                                                facebook = val;
                                                setState(() {});
                                              }),
                                          SocialMediaTile(
                                              imagePath:
                                                  AssetHelper.instagramIcon,
                                              hintText: 'Enter your instagram',
                                              onChange: (String val) {
                                                instagram = val;
                                                setState(() {});
                                              }),
                                          SocialMediaTile(
                                              imagePath:
                                                  AssetHelper.youtubeIcon,
                                              hintText: 'Enter your youtube',
                                              onChange: (String val) {
                                                youtube = val;
                                                setState(() {});
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomAppButton(
                                  titleText: 'Complete',
                                  isLoading: state is AuthLoading && state.showIndicator,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  onTap: () {
                                    getFocus(context);
                                    if (formKey.currentState!.validate()) {
                                      widget.bloc.add(CreateProfile(
                                          username: widget.bloc.username,
                                          uid: widget.bloc.uid,
                                          email: widget.bloc.email,
                                          profession: widget.bloc.profession,
                                          category1: widget.bloc.category1,
                                          category2: widget.bloc.category2,
                                          category3: widget.bloc.category3,
                                          phoneRate: double.parse(phoneRate.text),
                                          videoRate: double.parse(videoRate.text),
                                          about: summary.text,
                                          image: image!,
                                          socials: [
                                            linkedin,
                                            facebook,
                                            instagram,
                                            youtube
                                          ]));

                                    } else {
                                      showSnackBar(
                                          context,
                                          'Provide all the required information',
                                          'error');
                                    }
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ))),
    );
  }
}
