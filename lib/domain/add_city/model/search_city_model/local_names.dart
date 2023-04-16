import 'package:json_annotation/json_annotation.dart';

part 'local_names.g.dart';

@JsonSerializable()
class LocalNames {
  String? de;

  LocalNames({this.de});

  factory LocalNames.fromJson(Map<String, dynamic> json) {
    return _$LocalNamesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocalNamesToJson(this);
}
