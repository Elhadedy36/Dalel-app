
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,  this.onTap,
  });
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(onTap: onTap,child: Text(AppStrings.skip,style: CustomTextStyles.poppins300style16.copyWith(fontWeight: FontWeight.w400),)));
  }
}