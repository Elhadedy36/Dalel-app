import 'package:dalel/core/functions/navigation.dart';

import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widget/custom_signin_form.dart';
import 'package:dalel/features/auth/presentation/widget/habe_an_account_widget.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_banner.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: WelcomeBanner(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        SliverToBoxAdapter(
          child: WelcomTextWidget(text: 'Welcome Back'),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: custom_sign_in_form(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: HaveAnAccountWidget(
            text1: AppStrings.dontHaveAnAccount,
            text2: AppStrings.signUp,
            onTap: () {
              customReplacementNavigate(context, '/signUp');
            },
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
      ]),
    );
  }
}
