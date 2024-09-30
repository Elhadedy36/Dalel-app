import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class onBoardingBody extends StatelessWidget {
  onBoardingBody({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        

        controller: _controller,
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container
              (
                height: 290,
                width: 343,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(onBoardingData[index].imagePath),
                  fit: BoxFit.fill
                  )
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CustomSmoothPageIndicator(controller: _controller),
               SizedBox(
                height: 32,
              ),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              onBoardingData[index].title,style: CustomTextStyles.poppins400style24.copyWith(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
             ,
              SizedBox(
                height: 16,
              ),
            Text(maxLines: 2,
              overflow: TextOverflow.ellipsis,onBoardingData[index].subtitle,style: CustomTextStyles.poppins300style16,textAlign: TextAlign.center,)
            ],
          );
        },
      ),
    );
  }
}
