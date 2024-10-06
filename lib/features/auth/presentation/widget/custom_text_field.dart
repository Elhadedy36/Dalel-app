

import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.labelText, this.onChanged, this.onFieldSubmitted});
final String labelText;
final Function(String)? onChanged;
final Function(String)? onFieldSubmitted;
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8,left: 8,top: 24),
      child: TextFormField( 
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: CustomTextStyles.poppins500style18,
          border: getBorderStyle(),
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
return OutlineInputBorder
(
borderRadius: BorderRadius.circular(4),
borderSide: BorderSide(color: AppColors.lightGrey)
);

}