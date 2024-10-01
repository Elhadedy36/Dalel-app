
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/auth/presentation/widget/custom_checkbox_widget.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});
  @override

  Widget build(BuildContext context) {
    return Row
    (children: 
    [
      CustomCheckBox(),
      Text.rich(
        TextSpan(children: 
        [
          TextSpan(text: AppStrings.iHaveAgreeToOur,style: CustomTextStyles.poppins400style12), 
          TextSpan(text: AppStrings.TermsAndCondition,style: CustomTextStyles.poppins400style12.copyWith(decoration: TextDecoration.underline))
        ])
      ),
    ],

    );
  }
}