import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/app_strings.dart';

class WarsModel extends DataModel {
  WarsModel(
      {required super.name, required super.image, required super.description});

  factory WarsModel.fromJson(json) {
    return WarsModel(
        name: json[FirebaseStrings.name],
        image: json[FirebaseStrings.image],
        description: json[FirebaseStrings.description]);
  }
}
