import 'package:dalel/core/Services/Service_Locator.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_up_view.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splashview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const Splashview()),
  GoRoute(
      path: "/onBoarding", builder: (context, state) => const OnBoardingView()),
  GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignUpView(),
          )),
  GoRoute(
      path: "/signIn",
      builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignInView(),
          )),
]);
