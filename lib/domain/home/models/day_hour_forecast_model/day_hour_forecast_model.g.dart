// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_hour_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayHourForecastModel _$DayHourForecastModelFromJson(
        Map<String, dynamic> json) =>
    DayHourForecastModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => MainList.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayHourForecastModelToJson(
        DayHourForecastModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };
