import 'package:json_annotation/json_annotation.dart';

part 'search_city_model.g.dart';

@JsonSerializable()
class SearchCityModel {
  String? name;
  double? lat;
  double? lon;
  String? country;
  String? state;

  SearchCityModel({
    this.name,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  factory SearchCityModel.fromJson(Map<String, dynamic> json) {
    return _$SearchCityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchCityModelToJson(this);
}
