
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCategory extends StatelessWidget {
  const CustomShimmerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 140, 
          height: 96,
          child: Shimmer.fromColors(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: AppColors.Grey),
              ),
              baseColor: AppColors.Grey,
              highlightColor: Colors.white),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 140,
          height: 96,
          child: Shimmer.fromColors(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), color: AppColors.Grey),
              ),
              baseColor: AppColors.Grey,
              highlightColor: Colors.white),
        ),
      ],
    );
  }
}
