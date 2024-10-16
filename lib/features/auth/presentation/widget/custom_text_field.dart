

import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.labelText, this.onChanged, this.onFieldSubmitted, this.suffixIcon, this.obsecure,});
final String labelText;
final Function(String)? onChanged;
final Function(String)? onFieldSubmitted;
final bool? obsecure;
final Widget? suffixIcon;
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8,left: 8,top: 24),
      child: TextFormField( 
        
        obscureText: obsecure??false,

       validator: (value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  }
  return null;  // Return null if validation passes
},

        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
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