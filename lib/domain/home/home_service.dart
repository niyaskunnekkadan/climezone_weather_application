import 'package:clime_zone/domain/core/failure/main_failure.dart';

import 'package:clime_zone/domain/home/models/main_weather_model/main_weather_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeService {
  Future<Either<MainFailure, MainWeatherModel>> getMainWeatherData(
      String lat, String lon);
}
