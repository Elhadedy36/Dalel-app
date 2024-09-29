import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.color, required this.text});
final Color? color;
final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text,style: CustomTextStyles.poppins500style24.copyWith(fontSize: 18,color: AppColors.offWhite),),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: color??AppColors.primaryColor),
      ),
    );
  }
}
