import 'package:dalel/core/Services/Service_Locator.dart';
import 'package:dalel/core/database/Cache/Cache_Helper.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/custo_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/get_buttons.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/on_boardin_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              CustomNavBar
              (

                onTap: () {
                   onBoardingVisited();
                   customReplacementNavigate(context, '/signUp');}
              ),
              onBoardingBody(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 88,
              ),
              GetButtons(controller: _controller, currentIndex: currentIndex,),
              SizedBox(
                height: 17,
              )
            ],
          ),
        ),
      ),
    );
  }
}

