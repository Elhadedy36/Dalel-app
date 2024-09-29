import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splashview.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const Splashview()),
  GoRoute(path: "/onBoarding", builder: (context, state) => const OnBoardingView()),
]);
