import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kumquat_app/src/core/components/app_formfield.dart';

import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';

import 'package:kumquat_app/src/core/helper/space.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';
import 'package:kumquat_app/src/features/settings/presentation/widgets/radio_tile_widget.dart';


class LimitWidget extends StatelessWidget {
  const LimitWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.textfieldHint,
    required this.textfieldOnChange,
    required this.selected,
    required this.radioOnChange
  });
  final String title;
  final String subtitle;
  final String textfieldHint;
  final Function(String?) textfieldOnChange;
  final String selected;
  final Function(String?) radioOnChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.text16Bold,),
          verticalSpace(20),
          Text(subtitle, style: AppStyles.text14.secTextColor,),
          verticalSpace(20),
          AppFormField(
            hintText: textfieldHint,
            onChanged: (val)=>textfieldOnChange(val),
            controller: TextEditingController(),
            textstyle: AppStyles.text14.secondaryColor,
            type: TextInputType.number ,
            readOnly: selected == 'true' ? true : false,
          ),
          verticalSpace(20),
          RadioTileWidget(
              tileTitle: 'No Limit',
              value: 'true',
              selected: selected,
              onChanged: (value)=> radioOnChange(value)

          ),
        ],),
    );
  }
}
