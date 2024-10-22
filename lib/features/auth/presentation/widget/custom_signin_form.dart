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

class custom_sign_in_form extends StatelessWidget {
  const custom_sign_in_form({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is signinSuccessState) {
          showToast('Welcome Back');
          FirebaseAuth.instance.currentUser!.emailVerified == true
              ? customReplacementNavigate(context, '/homeNavBar')
              : showToast('Please Verify Your Email');
        } else if (state is signinFailureState) {
          showToast(state.error);
        }
      },
      builder: (context, state) {
        AuthCubit authcubit = BlocProvider.of<AuthCubit>(context);

        return Form(
            key: authcubit.signInFormKey,
            child: Column(
              children: [
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
                SizedBox(
                  height: 16,
                ),
                ForgotPassTextwidget(),
                SizedBox(
                  height: 102,
                ),
                state is signinLoadingState
                    ? CircularProgressIndicator()
                    : CustomBtn(
                        text: AppStrings.signIn,
                        onPressed: ()async {
                          if (authcubit.signInFormKey.currentState!
                              .validate()) {
                          await  authcubit.signInWithEmailAndPassword();
                          }
                        }),
              ],
            ));
      },
    );
  }
}
