import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_shimmer_category.dart';
import 'package:dalel/features/home/data/historical_periods.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection(FirebaseStrings.historicalperiods)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<HistoricalPeriodsModel> historicalperiods = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              historicalperiods
                  .add(HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]));
            }
            return SizedBox(
                height: 96,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => HistoricalPeriodItem(
                    model: historicalperiods[index],
                  ),
                ));
          }
          return CustomShimmerCategory();
        });
  }
}
