import 'package:json_annotation/json_annotation.dart';

import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

part 'main_weather_model.g.dart';

@JsonSerializable()
class MainWeatherModel {
  List<Weather>? weather;
  Main? main;
  Wind? wind;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;

  MainWeatherModel({
    this.weather,
    this.main,
    this.wind,
    this.sys,
    this.timezone,
    this.id,
    this.name,
  });

  factory MainWeatherModel.fromJson(Map<String, dynamic> json) {
    return _$MainWeatherModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainWeatherModelToJson(this);
}
