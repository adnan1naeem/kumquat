import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_colored_text_bar.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/custom_app_container.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/helper/focus_helper.dart';

import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';
import 'package:kumquat_app/src/features/settings/presentation/widgets/radio_tile_widget.dart';
import 'package:kumquat_app/src/features/settings/presentation/widgets/wallet_card.dart';

import '../widgets/limit_widget.dart';


@RoutePage<void>()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String privacyVal = '';
  String privateType ='';
  String phoneService = '';
  String videoService = '';
  TextEditingController phoneLimitController = TextEditingController();
  TextEditingController timeLimitController = TextEditingController();
  String phoneLimit = 'false' ; //true means no limit
  String timeLimit =  'false';

  @override
  Widget build(BuildContext context) {
    return  AppScaffold(
      resize: true,
      appbar: const CustomAppbar(titleText: 'Settings', allowBackNav: true, isSettingsScreen: true,),
        body: GestureDetector(
          onTap: ()=>getFocus(context),
          child: AppEclipseBackgroundBody(
            height: MediaQuery.sizeOf(context).height*0.3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomAppContainer(
                        padding: 0,
                        child: Column(
                          children: [
                            const AppColoredTextBar(title: 'Privacy', topRadius: true,),
                            privacyModule(),
                            const AppColoredTextBar(title: 'Payment'),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingText('Kumquat Wallet'),
                                  verticalSpace(15.0),
                                  WalletCard(
                                    balance: 110.72,
                                    tap: (){
                                      context.router.push(const AddFundsRoute());
                                    },
                                  ),
                                ],
                              ),
                            ),
                            verticalSpace(40),
                            const AppColoredTextBar(title: 'Limits'),
                            LimitWidget(
                                title: 'Payment',
                                subtitle: 'Stop Video/Phone At:',
                                textfieldHint: '\$',
                                textfieldOnChange: (val){},
                                selected: phoneLimit,
                                radioOnChange: (val){
                                  setState(() {
                                    phoneLimit = val ??'';
                                  });
                                }),
                            LimitWidget(
                                title: 'Time',
                                subtitle: 'Stop Time At:',
                                textfieldHint: 'mins',
                                textfieldOnChange: (val){},
                                selected: timeLimit,
                                radioOnChange: (val){
                                  setState(() {
                                    timeLimit = val ??'';
                                  });
                                }),
                          ],
                        )
                    ),
                    verticalSpace(100),
                    CustomAppButton(
                      onTap: (){},
                      titleText: 'Save',)
                  ],),
              ),
            ),),
        )
    );
  }
  Text headingText(String text)=> Text(text, style: AppStyles.text16Bold,);

  Widget privacyModule()=> Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingText('Search'),
          RadioTileWidget(
              tileTitle: 'Public Profile',
              value: 'public',
              selected: privacyVal,
              onChanged: (value){
                setState(() {
                  privacyVal = value ??'';
                  privateType = '';
                });
              }
          ),
          RadioTileWidget(
              tileTitle: 'Make Private',
              value: 'private',
              selected: privacyVal,
              onChanged: (value){
                setState(() {
                  privacyVal = value ??'';
                  privateType = value!=null? 'all': '';
                });
              }
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                RadioTileWidget(
                    tileTitle: 'ALL',
                    value: 'all',
                    selected: privateType,
                    onChanged: (value){
                      setState(() {
                        privacyVal == '' || privacyVal == 'public' ?
                        privacyVal = 'private' : null;
                        privateType = value ??'';
                      });
                    }
                ),
                RadioTileWidget(
                    tileTitle: 'Picture',
                    value: 'picture',
                    selected: privateType,
                    onChanged: (value){
                      setState(() {
                        privacyVal == '' || privacyVal == 'public' ?
                        privacyVal = 'private' : null;
                        privateType = value ??'';
                      });
                    }
                ),
                RadioTileWidget(
                    tileTitle: 'Summary',
                    value: 'summary',
                    selected: privateType,
                    onChanged: (value){
                      setState(() {
                        privacyVal == '' || privacyVal == 'public' ?
                        privacyVal = 'private' : null;
                        privateType = value ??'';
                      });
                    }
                ),
                RadioTileWidget(
                    tileTitle: 'Social Medial',
                    value: 'socials',
                    selected: privateType,
                    onChanged: (value){
                      setState(() {
                        privacyVal == '' || privacyVal == 'public' ?
                        privacyVal = 'private' : null;
                        privateType = value ??'';
                      });
                    }
                ),
              ],
            ),
          ),
          headingText('Services I provide'),
          RadioTileWidget(
              tileTitle: 'Phone Chat',
              value: 'phone',
              selected: phoneService,
              onChanged: (value){
                setState(() {
                  phoneService = value ??'';
                });
              }
          ),
          RadioTileWidget(
              tileTitle: 'Video Chat',
              value: 'video',
              selected: videoService,
              onChanged: (value){
                setState(() {
                  videoService = value ??'';
                });
              }
          ),
        ],
      ),
    );

}


