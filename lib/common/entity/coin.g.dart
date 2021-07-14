// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinAdapter extends TypeAdapter<Coin> {
  @override
  final int typeId = 0;

  @override
  Coin read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coin(
      uuid: fields[0] as String?,
      symbol: fields[1] as String?,
      name: fields[2] as String?,
      description: fields[3] as String?,
      iconUrl: fields[4] as String?,
      marketCap: fields[5] as String?,
      price: fields[6] as String?,
      rank: fields[7] as int?,
    )
      ..isFavorite = fields[8] as bool
      ..index = fields[9] as int;
  }

  @override
  void write(BinaryWriter writer, Coin obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.iconUrl)
      ..writeByte(5)
      ..write(obj.marketCap)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.rank)
      ..writeByte(8)
      ..write(obj.isFavorite)
      ..writeByte(9)
      ..write(obj.index);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
