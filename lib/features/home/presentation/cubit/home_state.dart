
 class HomeState {}

final class HomeInitial extends HomeState {}
final class GetHistoricalPeriodsSuccess extends HomeState {}
final class GetHistoricalPeriodsFailure extends HomeState 
{
  final String error;
  GetHistoricalPeriodsFailure(this.error);
}
final class GetHistoricalPeriodsLoading extends HomeState {}