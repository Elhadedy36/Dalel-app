import 'package:dalel/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(Dalel());
}


class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}