import 'package:json_annotation/json_annotation.dart';

import 'components.dart';
import 'main.dart';

part 'list.g.dart';

@JsonSerializable()
class AQIDataList {
  Main? main;
  Components? components;

  AQIDataList({this.main, this.components});

  factory AQIDataList.fromJson(Map<String, dynamic> json) =>
      _$AQIDataListFromJson(json);

  Map<String, dynamic> toJson() => _$AQIDataListToJson(this);
}
