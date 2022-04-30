// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_res_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListRespModelAdapter extends TypeAdapter<ListRespModel> {
  @override
  final int typeId = 0;

  @override
  ListRespModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListRespModel()
      .._id = fields[0] as int?
      .._name = fields[1] as String?
      .._username = fields[2] as String?
      .._profileImage = fields[9] as String?
      .._email = fields[3] as String?
      .._addressConcated = fields[4] as String?
      .._latLng = fields[5] as String?
      .._phone = fields[6] as String?
      .._website = fields[7] as String?
      .._companyConcated = fields[8] as String?;
  }

  @override
  void write(BinaryWriter writer, ListRespModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._username)
      ..writeByte(9)
      ..write(obj._profileImage)
      ..writeByte(3)
      ..write(obj._email)
      ..writeByte(4)
      ..write(obj._addressConcated)
      ..writeByte(5)
      ..write(obj._latLng)
      ..writeByte(6)
      ..write(obj._phone)
      ..writeByte(7)
      ..write(obj._website)
      ..writeByte(8)
      ..write(obj._companyConcated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListRespModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
