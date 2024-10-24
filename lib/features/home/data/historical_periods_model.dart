import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/wars_model.dart';

class HistoricalPeriodsModel extends DataModel {

  final List<WarsModel> wars;

  HistoricalPeriodsModel({
    required super.name,
    required super.image,
    required super.description,
    required this.wars,
  });

  factory HistoricalPeriodsModel.fromJson(json,warsList) {
    return HistoricalPeriodsModel(
      name: json[FirebaseStrings.name],
      image: json[FirebaseStrings.image],
      description: json[FirebaseStrings.description],
      wars: warsList,
    );
  }
}
