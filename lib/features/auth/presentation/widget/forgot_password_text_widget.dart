
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgotPassTextwidget extends StatelessWidget {
  const ForgotPassTextwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () 
      {
        customReplacementNavigate(context, '/forgetPass');
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(AppStrings.forgotPassword,style:CustomTextStyles.poppins600style28.copyWith(fontSize: 12) ,)),
    );
  }
}