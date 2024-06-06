import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_formfield.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/custom_app_container.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/helper/asset_helper.dart';
import 'package:kumquat_app/src/core/helper/space.dart';

import '../../../../core/theme/app_styles.dart';


@RoutePage<void>()
class AddFundsPage extends StatelessWidget {
  const AddFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const  CustomAppbar(
        allowBackNav: true,
        titleText: 'Add Funds',
      ),
        body: AppEclipseBackgroundBody(
          height: MediaQuery.sizeOf(context).height*0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomAppContainer(
                    padding: 10,
                      contentPadding: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: SvgPicture.asset(AssetHelper.walletSvg)),
                          verticalSpace(40),
                          headingText('Current Balance'),
                          Text('\$110', style: AppStyles.text28Bold.secondaryColor,),
                          verticalSpace(20),
                          headingText('Card Number'),
                          verticalSpace(10),
                          AppFormField(
                              hintText: '**** **** **** *123',
                              onChanged: (val){},
                              controller: TextEditingController(),
                            type: TextInputType.number,
                          ),
                          verticalSpace(10),
                          headingText('Payment Type'),
                          verticalSpace(10),
                          AppFormField(
                            hintText: 'Mastercard',
                            onChanged: (val){},
                            controller: TextEditingController(),
                          ),
                          verticalSpace(10),
                          Row(
                            children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  headingText('Expiration Date'),
                                  verticalSpace(10),
                                  AppFormField(
                                    hintText: 'Mastercard',
                                    onChanged: (val){},
                                    controller: TextEditingController(),
                                    type: TextInputType.datetime,
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpace(15),
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 headingText('CVV'),
                                 verticalSpace(10),
                                 AppFormField(
                                   hintText: 'Mastercard',
                                   onChanged: (val){},
                                   controller: TextEditingController(),
                                   type: TextInputType.number,
                                 ),
                               ],
                             ),
                           )
                          ],),
                          headingText('Amount'),
                          verticalSpace(10),
                          AppFormField(
                            hintText: '\$',
                            onChanged: (val){},
                            controller: TextEditingController(),
                          ),
                          verticalSpace(10),
                          headingText('New Balance'),
                          verticalSpace(10),
                          AppFormField(
                            hintText: '\$200',
                            readOnly: true,
                            onChanged: (val){},
                            controller: TextEditingController(),
                          ),
                          verticalSpace(10),
                        ],
                      )),
                  verticalSpace(20),
                  CustomAppButton(
                      onTap: (){},
                      titleText: 'Add',
                  )
                ],
              ),
            ),
          ),
        ));
  }
  Text headingText(String text)=> Text(text, style: AppStyles.text16Bold,);
}
