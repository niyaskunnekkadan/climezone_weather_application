import 'package:json_annotation/json_annotation.dart';

import 'city.dart';
import 'list.dart';

part 'day_hour_forecast_model.g.dart';

@JsonSerializable()
class DayHourForecastModel {
  List<MainList>? list;
  City? city;

  DayHourForecastModel({
    this.list,
    this.city,
  });

  factory DayHourForecastModel.fromJson(Map<String, dynamic> json) {
    return _$DayHourForecastModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DayHourForecastModelToJson(this);
}
