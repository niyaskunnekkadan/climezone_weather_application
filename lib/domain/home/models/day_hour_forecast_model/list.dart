import 'package:json_annotation/json_annotation.dart';

import 'main.dart';
import 'weather.dart';
import 'wind.dart';

part 'list.g.dart';

@JsonSerializable()
class MainList {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Wind? wind;
  @JsonKey(name: 'dt_txt')
  String? dtTxt;

  MainList({
    this.dt,
    this.main,
    this.weather,
    this.wind,
    this.dtTxt,
  });

  factory MainList.fromJson(Map<String, dynamic> json) =>
      _$MainListFromJson(json);

  Map<String, dynamic> toJson() => _$MainListToJson(this);
}
