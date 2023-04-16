import 'package:json_annotation/json_annotation.dart';

import 'list.dart';

part 'aq_index_model.g.dart';

@JsonSerializable()
class AqIndexModel {
  List<AQIDataList>? list;

  AqIndexModel({this.list});

  factory AqIndexModel.fromJson(Map<String, dynamic> json) {
    return _$AqIndexModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AqIndexModelToJson(this);
}
