// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AQIDataList _$AQIDataListFromJson(Map<String, dynamic> json) => AQIDataList(
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      components: json['components'] == null
          ? null
          : Components.fromJson(json['components'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AQIDataListToJson(AQIDataList instance) =>
    <String, dynamic>{
      'main': instance.main,
      'components': instance.components,
    };
