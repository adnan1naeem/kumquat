import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kumquat_app/src/core/components/app_button_rounded.dart';
import 'package:kumquat_app/src/core/components/app_formfield.dart';

import 'package:kumquat_app/src/core/helper/app_colors.dart';
import 'package:kumquat_app/src/core/helper/space.dart';


class SocialMediaTile extends StatefulWidget {
  const SocialMediaTile({
    super.key,
    required this.imagePath,
    required this.hintText,
    required this.onChange,
  });
  final String imagePath;
  final String hintText;
  final Function(String) onChange;

  @override
  State<SocialMediaTile> createState() => _SocialMediaTileState();
}

class _SocialMediaTileState extends State<SocialMediaTile> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          AppButtonRounded(
            tap: (){},
            icon: SvgPicture.asset(
              widget.imagePath,
              colorFilter: const ColorFilter.mode(
                  AppColors.white, BlendMode.srcIn),
            ),
            height: 40,
          ),
          horizontalSpace(15),
          Expanded(child: AppFormField(
            hintText: widget.hintText,
            controller: controller,
            onChanged: (val)=> widget.onChange(val),
            onValidate: (String? value) {
              if(value == null || value.isEmpty ){
                return 'Socials Must Be Provided';
              }
              return null;
            },
          ))
        ],
      ),
    );
  }
}
