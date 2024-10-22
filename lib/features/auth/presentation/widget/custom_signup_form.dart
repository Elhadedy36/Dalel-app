import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widget/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class custom_sign_Up_form extends StatelessWidget {
  const custom_sign_Up_form({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is signupSuccessState) {
          showToast('Successfully,check your email to verify your account');
          customReplacementNavigate(context, '/signIn');
        } else if (state is signupFailureState) {
          showToast(state.error);
        }
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
                  obsecure: authcubit.obsecure!,
                  suffixIcon: IconButton(
                      onPressed: () {
                        authcubit.obsecureTextUpdate();
                      },
                      icon: Icon(authcubit.obsecure!
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: AppStrings.password,
                  onChanged: (password) {
                    authcubit.password = password;
                  },
                ),
                TermsAndCondition(),
                SizedBox(
                  height: 88,
                ),
                state is signupLoadingState
                    ? CircularProgressIndicator()
                    : CustomBtn(
                        text: AppStrings.signUp,
                        color:
                            authcubit.termsAndConditionsCheckBoxValue == false
                                ? AppColors.Grey
                                : null,
                        onPressed: ()async {
                          if (authcubit.termsAndConditionsCheckBoxValue ==
                              true) {
                            if (authcubit.signUpFormKey.currentState!
                                .validate()) {
                             await authcubit.signUpWithEmailAndPassword();
                            } else {
                              print('how to show error message');
                            }
                          }
                        }),
              ],
            ));
      },
    );
  }
}
