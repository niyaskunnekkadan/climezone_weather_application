// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_place_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedPlaceModelAdapter extends TypeAdapter<SavedPlaceModel> {
  @override
  final int typeId = 0;

  @override
  SavedPlaceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedPlaceModel(
      fields[0] as int,
      latitude: fields[1] as double,
      longitude: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, SavedPlaceModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.latitude)
      ..writeByte(2)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedPlaceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
