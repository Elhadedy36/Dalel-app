import 'package:dalel/core/utils/app_strings.dart';

class HistoricalPeriodsModel {
  final String name;
  final String image;
  final String description;
  final Map<String, dynamic> wars;
  HistoricalPeriodsModel({
    required this.name,
    required this.image,
    required this.description,
    required this.wars,
  });

  factory HistoricalPeriodsModel.fromJson(json) {
    return HistoricalPeriodsModel(
      name: json[FirebaseStrings.name],
      image: json[FirebaseStrings.image],
      description: json[FirebaseStrings.description],
      wars: json[FirebaseStrings.wars],
    );
  }
}
