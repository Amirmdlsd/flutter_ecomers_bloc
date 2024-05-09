// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketModelAdapter extends TypeAdapter<BasketModel> {
  @override
  final int typeId = 0;

  @override
  BasketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketModel(
      id: fields[0] as String?,
      pId: fields[10] as int?,
      catId: fields[1] as String?,
      title: fields[2] as String?,
      image: fields[3] as String?,
      price: fields[4] as num?,
      discount: fields[5] as num?,
      mostSell: fields[7] as bool?,
      isHot: fields[6] as bool?,
      count: fields[9] as int?,
      finalPrice: fields[8] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, BasketModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.catId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.isHot)
      ..writeByte(7)
      ..write(obj.mostSell)
      ..writeByte(8)
      ..write(obj.finalPrice)
      ..writeByte(9)
      ..write(obj.count)
      ..writeByte(10)
      ..write(obj.pId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
