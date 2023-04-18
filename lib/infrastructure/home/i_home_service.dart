import 'dart:developer';

import 'package:clime_zone/domain/core/api/api_end_points.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/home/home_service.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/aq_index_model.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/list.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/day_hour_forecast_model.dart';
import 'package:clime_zone/domain/home/models/main_weather_model/main_weather_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeService)
class IHomeService implements HomeService {
  Dio dio = Dio();

  // Get Main Weather Data
  @override
  Future<Either<MainFailure, MainWeatherModel>> getMainWeatherData(
      String lat, String lon) async {
    final url = ApiEndPoints.currentWeatherApi
        .replaceAll('{lat}', lat)
        .replaceAll('{lon}', lon);
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(MainWeatherModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (_) {
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  // Get AQI data
  @override
  Future<Either<MainFailure, AqIndexModel>> getAirQualityData(
      String lat, String lon) async {
    final url = ApiEndPoints.airQualityIndexApi
        .replaceAll('{lat}', lat)
        .replaceAll('{lon}', lon);

    try {
      final response = await dio.get(url);
      log('index  ${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(AqIndexModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  // get day hour forecast
  @override
  Future<Either<MainFailure, DayHourForecastModel>> getDayHourForecastData(
      String lat, String lon) async {
    final url = ApiEndPoints.dateHourForecast
        .replaceAll('{lat}', lat)
        .replaceAll('{lon}', lon);

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(DayHourForecastModel.fromJson(response.data));
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
