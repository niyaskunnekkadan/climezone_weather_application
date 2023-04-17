part of 'day_hour_forecast_bloc.dart';

@freezed
class DayHourForecastEvent with _$DayHourForecastEvent {
  const factory DayHourForecastEvent.init({
    required double lat,
    required double lon,
  }) = Init;
}
