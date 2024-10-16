
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgetPassSubTitle extends StatelessWidget {
  const ForgetPassSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text('Enter your email below to receive password reset instruction',style:CustomTextStyles.poppins400style12.copyWith(fontSize: 14) ,textAlign: TextAlign.center,),
    );
  }
}