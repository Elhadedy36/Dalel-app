import 'package:dalel/core/Services/Service_Locator.dart';
import 'package:dalel/core/database/Cache/Cache_Helper.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
await getIt<CacheHelper>().init();
  runApp(Dalel());
}


class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}