import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/auth/presentation/widget/custom_forgot_password_form.dart';
import 'package:dalel/features/auth/presentation/widget/forgot_pass_image.dart';
import 'package:dalel/features/auth/presentation/widget/forgot_password_sub_title.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: CustomScrollView
      (
        slivers: 
        [
           SliverToBoxAdapter(child: SizedBox(height: 108),),
          SliverToBoxAdapter
          (
            child: WelcomTextWidget(text: AppStrings.forgotPassword),
          ),
                     SliverToBoxAdapter(child: SizedBox(height: 40),),

          SliverToBoxAdapter(child: ForgetPasswordImage(),)
        ,           SliverToBoxAdapter(child: SizedBox(height: 24),),

        SliverToBoxAdapter(child: ForgetPassSubTitle(),)
,        SliverToBoxAdapter(child: customForgotPasswordForm(),)
        
        ],
      ),
    );
  } 
}
