import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/custo_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/on_boardin_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold
      (
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: 
          [
            SizedBox(height: 40,),
            CustomNavBar(),
            onBoardingBody(),
            CustomBtn(text: AppStrings.next,),
            SizedBox(height: 17,)
          ],),
        ),
      ),
    );
  }
}
