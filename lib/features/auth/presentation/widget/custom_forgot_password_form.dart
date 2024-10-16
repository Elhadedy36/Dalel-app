import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widget/forgot_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customForgotPasswordForm extends StatelessWidget {
  const customForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is ResetPasswordSuccessState)
        {
          showToast('Check Your Email For Verification link');
          customReplacementNavigate(context, '/signIn');
        }else if(state is ResetPasswordFailureState)
        {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        AuthCubit authcubit = BlocProvider.of<AuthCubit>(context);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
             key: authcubit.forgotPasswordFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: AppStrings.emailAddress,
                    onChanged: (emailAddress) {
                      authcubit.emailAddress = emailAddress;
                    },
                  ), 
                  SizedBox(
                    height: 129,
                  ),
                  
                  
                  state is signinLoadingState
                      ? CircularProgressIndicator()
                      : CustomBtn(
                          text: AppStrings.sendVerificationCode,
                          onPressed: () {
                            if (authcubit.forgotPasswordFormKey.currentState!
                                .validate()) {
                              authcubit.resetPasswordWithLink();
                            }
                          }),
                ],
              )),
        );
      },
    );
  }
}
