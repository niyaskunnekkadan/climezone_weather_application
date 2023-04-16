import 'package:clime_zone/domain/add_city/model/search_city_model/search_city_model.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:dartz/dartz.dart';

abstract class AddCityService {
  Future<Either<MainFailure, SearchCityModel>> getCities(String place);
}
