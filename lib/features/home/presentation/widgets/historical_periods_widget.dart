import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/widgets/custom_shimmer_category.dart';
import 'package:dalel/features/home/presentation/cubit/home_cubit.dart';
import 'package:dalel/features/home/presentation/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/widgets/historical_periods_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
       if (state is GetHistoricalPeriodsFailure) {
          showToast(state.error);
        }
      },
      builder: (context, state) {


        return state is GetHistoricalPeriodsLoading?CustomShimmerCategory(): SizedBox(

                    height: 96,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      itemCount: context.read<HomeCubit>().historcalperiods.length,
                      itemBuilder: (context, index) => HistoricalPeriodItem(
                        model: context.read<HomeCubit>().historcalperiods[index],
                      ),
                    )) ;


        // return FutureBuilder<QuerySnapshot>(
        //     future: FirebaseFirestore.instance
        //         .collection(FirebaseStrings.historicalperiods)
        //         .get(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError) {
        //         return Text("Something went wrong");
        //       }

        //       if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
        //         return Text("Document does not exist");
        //       }

        //       if (snapshot.connectionState == ConnectionState.done) {
        //         List<HistoricalPeriodsModel> historicalperiods = [];
        //         for (int i = 0; i < snapshot.data!.docs.length; i++) {
        //           historicalperiods.add(
        //               HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]));
        //         }
        //         return SizedBox(
        //             height: 96,
        //             child: ListView.separated(
        //               physics: BouncingScrollPhysics(),
        //               scrollDirection: Axis.horizontal,
        //               separatorBuilder: (context, index) => const SizedBox(
        //                 width: 20,
        //               ),
        //               itemCount: snapshot.data!.docs.length,
        //               itemBuilder: (context, index) => HistoricalPeriodItem(
        //                 model: historicalperiods[index],
        //               ),
        //             ));
        //       }
        //       return CustomShimmerCategory();
        //     });
      },
    );
  }
}
