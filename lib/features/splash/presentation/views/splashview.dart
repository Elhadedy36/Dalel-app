import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    futureNavigate(context);
    
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
void futureNavigate(context) {
   Future.delayed(
     const Duration(seconds: 2),
     ()
     {
       customNavigate(context, "/onBoarding");
     }
   );
 }