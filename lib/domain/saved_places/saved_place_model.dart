import 'package:hive_flutter/hive_flutter.dart';
part 'saved_place_model.g.dart';

@HiveType(typeId: 0)
class SavedPlaceModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final double latitude;
  @HiveField(2)
  final double longitude;

  SavedPlaceModel(this.id, {required this.latitude, required this.longitude});

  @override
  String toString() {
    // TODO: implement toString
    return '$latitude $longitude';
  }
}
