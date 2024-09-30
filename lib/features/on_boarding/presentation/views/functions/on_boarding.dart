import 'package:dalel/core/Services/Service_Locator.dart';
import 'package:dalel/core/database/Cache/Cache_Helper.dart';

void onBoardingVisited()
{
  getIt<CacheHelper>().put(key: 'isOnBoardingVisited', value: true);
}