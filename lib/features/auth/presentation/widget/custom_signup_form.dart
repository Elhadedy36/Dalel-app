import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widget/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customSifnUpForm extends StatelessWidget {
  const customSifnUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AuthCubit authcubit = BlocProvider.of<AuthCubit>(context);

        return Form(
          key: authcubit.signUpFormKey,
            child: Column(
          children: [
            CustomTextFormField(
              labelText: AppStrings.fristName,
              onChanged: (fristName) {
                authcubit.fristName = fristName;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.lastName,
              onChanged: (lastName) {
                authcubit.lastName = lastName;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.emailAddress,
              onChanged: (emailAddress) {
                authcubit.emailAddress = emailAddress;
              },
            ),
            CustomTextFormField(
              labelText: AppStrings.password,
              onChanged: (password) {
                authcubit.password = password;
              },
            ),
            TermsAndCondition(),
            SizedBox(
              height: 88,
            ),
            CustomBtn(
                text: AppStrings.signUp,
                color: authcubit.termsAndConditionsCheckBoxValue==false? AppColors.Grey:null ,
                onPressed: () {
                  if(authcubit.termsAndConditionsCheckBoxValue == true){
                    
                  if(authcubit.signUpFormKey.currentState!.validate()){
                    authcubit.signUpWithEmailAndPassword();
                  }
                  }
                }),
          ],
        ));
      },
    );
  }
}
