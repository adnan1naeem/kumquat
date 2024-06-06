import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kumquat_app/src/core/components/app_colored_text_bar.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_container.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';
import 'package:kumquat_app/src/features/profile_and_search/presentation/widgets/profile_skills_chip.dart';
import 'package:kumquat_app/src/features/profile_and_search/presentation/widgets/review_card.dart';

import '../../../../core/helper/asset_helper.dart';
import '../widgets/profile_contact_widget.dart';
import '../widgets/socials_bar_widget.dart';
import '../widgets/user_profile_avatar.dart';

@RoutePage<void>()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appbar: const CustomAppbar(
          titleText: 'TonyDS6',
          allowBackNav: true,
        ),
        body: SingleChildScrollView(
          child: AppEclipseBackgroundBody(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: MediaQuery.sizeOf(context).height * 0.05),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const UserProfileAvatar(
                            image: AssetHelper.placeholder,
                          ),
                          verticalSpace(15),
                          profileTile('Average Rating', '7.4/10'),
                          profileTile('Kumquats', ' 25'),
                        ],
                      )),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileContactWidget(
                        title: 'Message',
                        rate: 0,
                        icon: AssetHelper.messageIcon,
                        padding: 12,
                        hideRate: true,
                      ),
                      horizontalSpace(20),
                      const ProfileContactWidget(
                        title: 'Phone',
                        rate: 25,
                        padding: 12,
                        icon: AssetHelper.phoneIcon,
                      ),
                      horizontalSpace(20),
                      const ProfileContactWidget(
                        title: 'Video',
                        rate: 25,
                        icon: AssetHelper.videoIcon,
                        padding: 4,
                      ),
                    ],
                  ),
                  verticalSpace(40),
                  CustomAppContainer(
                    padding: 0,
                      // contentPadding: 15,
                      child: Column(
                        children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               headingText('Summary'),
                               verticalSpace(10),
                               Text('lorem ipsum lorem ipsum lorem ipsumlorem ipsumlorem ipsumlorem ipsumvlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumvvvvvvvvvlorem ipsumlorem ipsumvlorem ipsumlorem ipsumvvlorem ipsum',
                                 style: AppStyles.text14.secTextColor,
                               ),
                               verticalSpace(50),
                               headingText('Skills'),
                               verticalSpace(10),
                               const Wrap(
                                 spacing: 10,
                                 runSpacing: 10,
                                 children:  [
                                   ProfileSkillsChip(skillText: 'FIFA202'),
                                   ProfileSkillsChip(skillText: 'XBOX-360'),
                                   ProfileSkillsChip(skillText: 'Football Games'),
                                   ProfileSkillsChip(skillText: 'Subject Matter Expert'),
                                 ],),
                               verticalSpace(20),
                               headingText('Reviews'),
                               Container(
                                 height: 250,
                                 child: ListView.builder(
                                   itemCount: 5,
                                     itemBuilder: (context, index){
                                       return  const ReviewCard(name: 'Matt', score: 2.5, reviewText: 'I wasn\' impressed, he couldn\' help me, it was not good');

                                     }),
                               ),
                               verticalSpace(20),
                             ],
                           ),
                         ),
                          const AppColoredTextBar(title: 'Social Media'),
                          verticalSpace(20),
                          const SocialsBarWidget(),
                          verticalSpace(40),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget headingText(String text)=> Text(text, style: AppStyles.text14Bold,);

   Widget profileTile(String title, String value) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$title:  ',
            style: AppStyles.text14Bold,
          ),
          horizontalSpace(60),
          Text(
            value,
            style: AppStyles.text14Bold,
          )
        ],
      );
}



