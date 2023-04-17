// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCityModel _$SearchCityModelFromJson(Map<String, dynamic> json) =>
    SearchCityModel(
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$SearchCityModelToJson(SearchCityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
    };
