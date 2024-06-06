import 'package:flutter/material.dart';

import 'package:kumquat_app/src/core/extensions/typography_extensions.dart';
import 'package:kumquat_app/src/core/theme/app_styles.dart';

import '../helper/app_colors.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
    required this.hintText,
    required this.onChange,
    required this.dropdownList,
  });
  final String hintText;
  final Function(String?) onChange;
  final List<String> dropdownList;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        value: selectedValue,
        isExpanded: true,
        hint: Text(
          'I am',
          style: AppStyles.text14.secTextColor,
        ),
        validator: (val) {
          if (val == null ||val.isEmpty) {
            return 'Must be selected';
          } else {
            return null;
          }
        },
        borderRadius: BorderRadius.circular(10),
        focusColor: AppColors.lightGrey,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.secondaryTextColor,
        ),
        dropdownColor: AppColors.lightGrey,
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColors.lightGrey,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
        items: widget.dropdownList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: AppStyles.text14.secTextColor,
                  ),
                ))
            .toList(),
        onChanged: (val) {
          selectedValue = val;
          widget.onChange(val.toString());
        });
  }
}
