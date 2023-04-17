part of 'day_hour_forecast_bloc.dart';

@freezed
class DayHourForecastState with _$DayHourForecastState {
  const factory DayHourForecastState({
    required List<MainList> perThreeHour,
    City? city,
    required bool isLoading,
    required bool hasError,
  }) = _DayHourForecastState;

  factory DayHourForecastState.initial() => const DayHourForecastState(
        perThreeHour: [],
        isLoading: false,
        hasError: false,
      );
}
