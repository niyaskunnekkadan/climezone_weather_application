// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeatherModel _$MainWeatherModelFromJson(Map<String, dynamic> json) =>
    MainWeatherModel(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MainWeatherModelToJson(MainWeatherModel instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
    };
