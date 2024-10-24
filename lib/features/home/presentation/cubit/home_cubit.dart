import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/historical_periods_model.dart';
import 'package:dalel/features/home/data/wars_model.dart';
import 'package:dalel/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<HistoricalPeriodsModel> historcalperiods = [];
  List<WarsModel> warsList = [];

  getHistoricalPeriods() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      await FirebaseFirestore.instance
          .collection(FirebaseStrings.historicalperiods)
          .get()
          .then((val) => val.docs.forEach((element) async {
                await getarsList(element);

                historcalperiods.add(
                  HistoricalPeriodsModel.fromJson(element.data(), warsList),
                );
                emit(GetHistoricalPeriodsSuccess());
              }));
    } on Exception catch (e) {
      emit(GetHistoricalPeriodsFailure(e.toString()));
    }
  }

  Future<void> getarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FirebaseStrings.historicalperiods)
        .doc(element.id)
        .collection(FirebaseStrings.wars)
        .get()
        .then((value) => value.docs.forEach((element) {
              warsList.add(WarsModel.fromJson(element.data()));
            }));
  }
}
