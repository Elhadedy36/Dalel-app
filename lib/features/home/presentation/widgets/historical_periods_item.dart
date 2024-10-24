import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/home/data/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key, required this.model});

  final HistoricalPeriodsModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AppColors.Grey,

            blurRadius: 10,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: 16,
        ),
        SizedBox(
            height: 48,
            width: 65,
            child: Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: CustomTextStyles.poppins500style18
                  .copyWith(fontSize: 16, color: AppColors.deepBrown),
            )),
        Container(
          height: 64,
          width: 47,
          child: CachedNetworkImage(
            imageUrl: model.image,
            placeholder: (context, url) => Shimmer.fromColors(
                child: Container(
                  width: 47,
                  height: 64,
                  color: AppColors.Grey,
                ),
                baseColor: AppColors.Grey,
                highlightColor: Colors.white),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ]),
    );
  }
}
