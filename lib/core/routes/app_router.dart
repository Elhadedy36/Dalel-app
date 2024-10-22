import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view/forget_password_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_up_view.dart';
import 'package:dalel/features/cart/presentation/views/cart_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/home/presentation/widgets/home_nav_bar_widget.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:dalel/features/splash/presentation/views/splashview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const Splashview()),
  GoRoute(path: "/homeNavBar", builder: (context, state) => const HomeNavBarWidget()),
  GoRoute(path: "/cartView", builder: (context, state) => const CartView()),
  GoRoute(path: "/searchView", builder: (context, state) => const SearchView()),
  GoRoute(path: "/profileView", builder: (context, state) => const ProfileView()),
  GoRoute(
      path: "/onBoarding", builder: (context, state) => const OnBoardingView()),
  GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          )),
  GoRoute(
      path: "/signIn",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignInView(),
          )),
  GoRoute(path: "/home", builder: (context, state) => const HomeView()),
  GoRoute(
      path: "/forgetPass",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgetPasswordView(),
          )),
]);
