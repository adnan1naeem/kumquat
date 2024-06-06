import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_scaffold.dart';
import 'package:kumquat_app/src/core/components/custom_app_button.dart';
import 'package:kumquat_app/src/core/components/eclipse_header.dart';
import 'package:kumquat_app/src/core/helper/helper_functions.dart';
import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/routes/app_router.gr.dart';

import '../../../../core/components/custom_dropdown_button.dart';
import '../../../../core/constants/profile_creation_lists.dart';
import '../widgets/new_profile_dropdown_widget.dart';

@RoutePage<void>()
class NewProfilePageOne extends StatefulWidget {
  const NewProfilePageOne({super.key});

  @override
  State<NewProfilePageOne> createState() => _NewProfilePageOneState();
}

class _NewProfilePageOneState extends State<NewProfilePageOne> {
  String? professionSelected;
  String? category1SelectedVal;
  String? category2SelectedVal;
  String? category3SelectedVal;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
      children: [
        const EclipseHeader(
          height: 100,
          isBackAllow: true,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      NewProfileDropdownWidget(
                        dropdown: CustomDropdownButton(
                            dropdownList: ProfileCreationLists.professionList,
                            hintText: 'I am',
                            onChange: (val) {
                              setState(() {
                                professionSelected = val!;
                              });
                            }),
                        labelText: 'Choose your profession:',
                      ),
                      verticalSpace(10),
                      NewProfileDropdownWidget(
                          dropdown: CustomDropdownButton(
                              dropdownList: ProfileCreationLists.category1List,
                              hintText: 'I am',
                              onChange: (val) {
                                setState(() {
                                  category1SelectedVal = val!;
                                });
                              }),
                          labelText: 'Sub-Category:'),
                      verticalSpace(10),
                      NewProfileDropdownWidget(
                          dropdown: CustomDropdownButton(
                              dropdownList: ProfileCreationLists.category2List,
                              hintText: 'I am',
                              onChange: (val) {
                                setState(() {
                                  category2SelectedVal = val!;
                                });
                              }),
                          labelText: 'Sub-Category:'),
                      verticalSpace(10),
                      NewProfileDropdownWidget(
                          dropdown: CustomDropdownButton(
                              dropdownList: ProfileCreationLists.category3List,
                              hintText: 'I am',
                              onChange: (val) {
                                setState(() {
                                  category3SelectedVal = val!;
                                });
                              }),
                          labelText: 'Sub-Category:'),
                    ],
                  ),
                  CustomAppButton(titleText: 'Done',
                      onTap: () {
                    if(formKey.currentState!.validate()){
                      context.router.push(const NewProfileRouteTwo());
                    }else{
                      showSnackBar(context, 'Must Select fields', 'error');
                    }
                  })
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
