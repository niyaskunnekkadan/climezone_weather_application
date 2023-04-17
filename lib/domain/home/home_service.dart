import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/aq_index_model.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/list.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/day_hour_forecast_model.dart';

import 'package:clime_zone/domain/home/models/main_weather_model/main_weather_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeService {
  Future<Either<MainFailure, MainWeatherModel>> getMainWeatherData(
      String lat, String lon);

  Future<Either<MainFailure, AqIndexModel>> getAirQualityData(
      String lat, String lon);

  Future<Either<MainFailure, DayHourForecastModel>> getDayHourForecastData(
      String lat, String lon);
}
