import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/widget/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widget/habe_an_account_widget.dart';
import 'package:dalel/features/auth/presentation/widget/terms_and_condition.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 152,
              ),
            ),
            SliverToBoxAdapter(
              child: WelcomTextWidget(text: AppStrings.welcome),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.fristName,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.lastName,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.emailAddress,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.password,
              ),
            ),
            SliverToBoxAdapter(
              child: TermsAndCondition(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 88,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomBtn(
                text: AppStrings.signUp,
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16,),),
            SliverToBoxAdapter(child: HaveAnAccountWidget(text1: AppStrings.alreadyHaveAnAccount,text2: AppStrings.signIn,),)
          ],
        ),
      ),
    );
  }
}