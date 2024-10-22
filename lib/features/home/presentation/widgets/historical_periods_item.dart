import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/home/data/historical_periods.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_widget.dart';
import 'package:flutter/material.dart';

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
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(model.image), fit: BoxFit.fill)),
        ),
        SizedBox(
          width: 16,
        ),
      ]),
    );
  }
}
