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
        return Form(
            child: Column(
          children: [
             CustomTextFormField(labelText: AppStrings.fristName,
             onChanged: (fristName)
             {
BlocProvider.of<AuthCubit>(context).fristName =fristName;
             },),
             CustomTextFormField(labelText: AppStrings.lastName,
             onChanged: (lastName)
             {
BlocProvider.of<AuthCubit>(context).lastName =lastName;

             },),
             CustomTextFormField(labelText: AppStrings.emailAddress,
             onChanged: (emailAddress)
             {
              BlocProvider.of<AuthCubit>(context).emailAddress =emailAddress;

             },),
             CustomTextFormField(labelText: AppStrings.password,
             onChanged: (password)
             {
BlocProvider.of<AuthCubit>(context).password =password;
             },
             ),
             TermsAndCondition(),
             SizedBox(
              height: 88,
            ),
            CustomBtn(text: AppStrings.signUp, onPressed: () 
            {
              BlocProvider.of<AuthCubit>(context).signUpWithEmailAndPassword();
            }),
          ],
        ));
      },
    );
  }
}
