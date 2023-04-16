import 'package:json_annotation/json_annotation.dart';

part 'components.g.dart';

@JsonSerializable()
class Components {
  double? co;
  double? no;
  double? no2;
  double? o3;
  double? so2;
  @JsonKey(name: 'pm2_5')
  double? pm25;
  double? pm10;
  double? nh3;

  Components({
    this.co,
    this.no,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.nh3,
  });

  factory Components.fromJson(Map<String, dynamic> json) {
    return _$ComponentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComponentsToJson(this);
}
