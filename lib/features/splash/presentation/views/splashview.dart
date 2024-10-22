import 'package:dalel/core/Services/Service_Locator.dart';
import 'package:dalel/core/database/Cache/Cache_Helper.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;

    if (isOnBoardingVisited == true) {
      FirebaseAuth.instance.currentUser == null
          ? futureNavigate(context, '/signIn')
          :FirebaseAuth.instance.currentUser!.emailVerified == true ? futureNavigate(context, '/homeNavBar'):futureNavigate(context, '/signIn');
    } else {
      futureNavigate(context, '/onBoarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}

void futureNavigate(context, String path) {
  Future.delayed(const Duration(seconds: 2), () {
    customReplacementNavigate(context, path);
  });
}
