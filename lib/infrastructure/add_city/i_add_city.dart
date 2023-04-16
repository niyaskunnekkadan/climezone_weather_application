import 'dart:convert';
import 'dart:developer';

import 'package:clime_zone/domain/add_city/add_city_service.dart';
import 'package:clime_zone/domain/core/api/api_end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/add_city/model/search_city_model/search_city_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddCityService)
class IAddCity implements AddCityService {
  @override
  Future<Either<MainFailure, SearchCityModel>> getCities(String place) async {
    final url = ApiEndPoints.searchPlaceApi.replaceAll('{val}', place);
    Dio dio = Dio(BaseOptions(responseType: ResponseType.plain));

    Map<String, dynamic> listToMap(List<dynamic> d) {
      return d[0];
    }

    try {
      final response = await dio.get(url);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonn = jsonDecode(response.data);
        return Right(SearchCityModel.fromJson(listToMap(jsonn)));
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (_) {
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
