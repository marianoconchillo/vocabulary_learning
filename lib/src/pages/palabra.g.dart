// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palabra.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PalabraAdapter extends TypeAdapter<Palabra> {
  @override
  Palabra read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Palabra(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Palabra obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nombre)
      ..writeByte(1)
      ..write(obj.traduccion);
  }
}
