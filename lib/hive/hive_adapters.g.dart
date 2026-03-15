// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class DataTaskAdapter extends TypeAdapter<DataTask> {
  @override
  final typeId = 0;

  @override
  DataTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataTask(
      id: fields[0] as String,
      title: fields[1] as String,
      descrbtion: fields[2] as String,
      date: fields[3] as String,
      startTime: fields[4] as String,
      endTime: fields[5] as String,
      isCompleted: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DataTask obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.descrbtion)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.startTime)
      ..writeByte(5)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
