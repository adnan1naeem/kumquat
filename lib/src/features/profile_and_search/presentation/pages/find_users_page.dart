import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_eclipse_background_body.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/custom_app_container.dart';
import 'package:kumquat_app/src/core/components/custom_appbar.dart';
import 'package:kumquat_app/src/core/components/custom_dropdown_button.dart';
import 'package:kumquat_app/src/core/constants/profile_creation_lists.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';

@RoutePage<void>()
class FindUsersPage extends StatelessWidget {
  const FindUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appbar: const CustomAppbar(titleText: 'Find Users'),
        body: AppEclipseBackgroundBody(
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppContainer(
                  padding: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('I am Looking For', style: AppStyles.text18w800,),
                        verticalSpace(30),
                      CustomDropdownButton(
                          hintText: 'I am ',
                          onChange: (val){},
                          dropdownList: ProfileCreationLists.professionList),
                      verticalSpace(10),
                      CustomDropdownButton(
                          hintText: 'I am ',
                          onChange: (val){},
                          dropdownList: ProfileCreationLists.category1List),
                      verticalSpace(10),
                      CustomDropdownButton(
                          hintText: 'Iam ',
                          onChange: (val){},
                          dropdownList: ProfileCreationLists.category2List),
                      verticalSpace(10),
                      CustomDropdownButton(
                          hintText: 'Iam ',
                          onChange: (val){},
                          dropdownList: ProfileCreationLists.category3List)

                                        ],
                                      ),
                    )),
                CustomAppButton(
                    titleText: 'Find',
                    onTap: () {
                      context.router.push(const SearchResultsRoute());
                    })
              ],
            ),
          ),
        ));
  }
}
