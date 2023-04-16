// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aq_index_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AqIndexModel _$AqIndexModelFromJson(Map<String, dynamic> json) => AqIndexModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => AQIDataList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AqIndexModelToJson(AqIndexModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
