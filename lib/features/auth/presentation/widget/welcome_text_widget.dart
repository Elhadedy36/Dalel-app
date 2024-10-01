
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomTextWidget extends StatelessWidget {
  const WelcomTextWidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(text,style: CustomTextStyles.poppins600style28,));
  }
}