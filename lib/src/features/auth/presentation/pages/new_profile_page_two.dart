import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/custom_app_container.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';
import 'package:kumquat_app/src/core/helper/helper_functions.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/features/auth/presentation/widgets/auth_form_field_widget.dart';

import '../../../../core/components/app_colored_text_bar.dart';
import '../../../../core/helper/asset_helper.dart';
import '../../../../core/helper/formfield_validators.dart';
import '../widgets/social_media_tile.dart';

@RoutePage<void>()
class NewProfilePageTwo extends StatefulWidget {
  const NewProfilePageTwo({super.key});

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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        getFocus(context);
      },
      child: AppScaffold(
          appbar: const CustomAppbar(
            titleText: 'Username',
          ),
          resize: true,
          body: AppEclipseBackgroundBody(
            height: MediaQuery.sizeOf(context).height * 0.35 ,
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
                          const CircleAvatar(
                            radius: 50,
                          ),
                          verticalSpace(10),
                          CustomAppButton(
                              titleText: 'Upload Photo',
                              width: 120,
                              height: 40,
                              onTap: () {})
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
                                    onChanged: (val){},
                                    validator: FormfieldValidators.userNameValidator,
                                    hintText: 'Enter amount between \$1 to \$1000',
                                    keyboardType: TextInputType.number,
                                  ),
                                  AuthFormFieldWidget(
                                    controller:  videoRate,
                                    labelText: 'Video Chat Rate',
                                    onChanged: (val){},
                                    validator: FormfieldValidators.userNameValidator,
                                    hintText:
                                    'Enter amount between \$1 to \$1000',
                                    keyboardType: TextInputType.number,
                                  ),
                                  AuthFormFieldWidget(
                                    controller: summary,
                                    labelText: 'Summary',
                                    onChanged: (val){},
                                    validator: FormfieldValidators.userNameValidator,
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
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                              child: Column(
                                children: [
                                  SocialMediaTile(
                                      imagePath: AssetHelper.linkedinIcon,
                                      hintText: 'Enter your linkedin',
                                      onChange: (String val){
                                        linkedin = val;
                                        setState(() {});
                                      }
                                  ),
                                  SocialMediaTile(
                                      imagePath: AssetHelper.fbIcon,
                                      hintText: 'Enter your facebok',
                                      onChange: (String val){
                                        facebook = val;
                                        setState(() {});
                                      }
                                  ),
                                  SocialMediaTile(
                                      imagePath: AssetHelper.instagramIcon,
                                      hintText: 'Enter your instagram',
                                      onChange: (String val){
                                        instagram = val;
                                        setState(() {});
                                      }
                                  ),
                                  SocialMediaTile(
                                      imagePath: AssetHelper.youtubeIcon,
                                      hintText: 'Enter your youtube',
                                      onChange: (String val){
                                        youtube = val;
                                        setState(() {});
                                      }
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      CustomAppButton(
                          titleText: 'Complete',
                          padding: const  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              context.router.replaceAll([const FindUsersRoute()]);
                            }else{
                              showSnackBar(context, 'Provide all the required information', 'error');
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          )
         ),
    );
  }
}